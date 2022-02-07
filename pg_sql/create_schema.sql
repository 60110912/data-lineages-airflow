CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;

CREATE FUNCTION public.fn_sql_to_hash(p_sql_query text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE var_res TEXT;
begin
    
        SELECT md5(array_to_string(regexp_split_to_array(lower(p_sql_query), '(\s|\,)+'),' ')) INTO var_res;
       RETURN var_res;
end
$$;

CREATE SCHEMA data_usage_raw;
CREATE TABLE data_usage_raw.queries_history (
    pk_queries_history serial NOT NULL PRIMARY KEY,
    json_object text,
    created_dttm timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone
);


CREATE SCHEMA metadata;
CREATE TABLE metadata.etl_info (
    pk_etl_info serial NOT NULL PRIMARY KEY,
    process_name text,
    object_name text,
    date_from timestamp without time zone,
    created_dttm timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone
);

CREATE UNIQUE INDEX etl_info_process_name_idx ON metadata.etl_info USING btree (process_name, object_name, pk_etl_info DESC);

CREATE FUNCTION metadata.fn_set_etl_info_last_date_from(p_process_name text, p_object_name text, p_date_from timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
    INSERT INTO metadata.etl_info (process_name, object_name, date_from) VALUES(p_process_name, p_object_name, p_date_from);
end
$$;

CREATE FUNCTION metadata.fn_get_etl_info_last_date_from(p_process_name text, p_object_name text) RETURNS timestamp without time zone
    LANGUAGE plpgsql
    AS $$
declare
    var_date_from Timestamp;
BEGIN
	
	SELECT date_from INTO var_date_from
	FROM metadata.etl_info
	WHERE 
		process_name = p_process_name 
		AND  object_name = p_object_name
	ORDER BY pk_etl_info DESC
	LIMIT 1;
    RETURN coalesce(var_date_from, '1990-01-01'::timestamp);
end
$$;


CREATE SCHEMA data_usage_marts;

CREATE TABLE data_usage_marts.f_query_with_tables_columns (
	pk_f_query_with_tables_columns serial NOT NULL Primary KEY,
	fk_queries_history int4 NULL,
	select_ts timestamp NULL,
	"user_name" text NULL,
	"db_name" text NULL,
	"table_name" text NULL,
	"table_colum" text NULL,
	"table_schema" text NULL,
	"rows_out" text NULL,
    created_dttm timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone
);

CREATE OR REPLACE FUNCTION data_usage_marts.fn_load_f_query_with_tables_columns(p_process_name text, p_object_name text DEFAULT 'data_usage_marts.f_query_with_tables_columns'::text) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE 
	var_date_from Timestamp;
	var_date_to Timestamp = now()::timestamp;

BEGIN

	SELECT metadata.fn_get_etl_info_last_date_from(p_process_name, p_object_name) INTO var_date_from;
	
	SELECT COALESCE(MAX(created_dttm), now()::timestamp) INTO var_date_to
	FROM data_usage_raw.queries_history;
	IF NOT (var_date_from < var_date_to) THEN RETURN;
	END IF;
    drop table if exists tt_f_query_with_tables_columns;
    create temp table tt_f_query_with_tables_columns as
		SELECT 
			source_tbl.pk_queries_history AS fk_queries_history,
			((source_tbl.json_object::json)->>'ctime')::timestamp AS select_ts,
			(source_tbl.json_object::json)->>'user_name' AS user_name,
			(source_tbl.json_object::json)->>'db' AS db_name,
			col->>'table_name' AS table_name,
			col->>'table_colum' AS table_colum,
			col->>'table_schema' AS table_schema,
			(source_tbl.json_object::json)->>'rows_out' AS rows_out
		FROM data_usage_raw.queries_history source_tbl,
			jsonb_path_query(source_tbl.json_object::jsonb, '$.columns[*]') AS col
		WHERE 
			source_tbl.json_object IS NOT NULL
		  	AND source_tbl.created_dttm > var_date_from
		  	AND source_tbl.created_dttm <= var_date_to;

	
	DELETE FROM  data_usage_marts.f_query_with_tables_columns AS target 
	USING tt_f_query_with_tables_columns AS t
	WHERE target.fk_queries_history=t.fk_queries_history;
	
	INSERT INTO data_usage_marts.f_query_with_tables_columns (fk_queries_history, select_ts, user_name, db_name, table_name, table_colum, table_schema, rows_out)
	SELECT fk_queries_history, select_ts, user_name, db_name, table_name, table_colum, table_schema, rows_out
	FROM tt_f_query_with_tables_columns;

	PERFORM metadata.fn_set_etl_info_last_date_from(p_process_name, p_object_name, var_date_to);
    drop table if exists tt_f_query_with_tables_columns;
end;
$_$;



