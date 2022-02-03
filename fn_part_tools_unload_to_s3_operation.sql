CREATE OR REPLACE function fn_gp_queries_history_to_s3_operation(
        p_date_from TIMESTAMP,
        p_date_to TIMESTAMP,
        p_s3_server_name text default 'default',
        p_s3_bucket text default 'd-dp-data-usage'
    )
returns void
language plpgsql

as
$$
declare
    var_target_table_name text;
    var_sql_exec text = '';
    var_s3_connect text;
    var_end_table text;
    var_ext_write_table_name text;
begin
    var_target_table_name = 'queries_history';
    var_end_table = regexp_replace((now()::date)::TEXT, '-', '_', 'g');
    var_ext_write_table_name =  var_target_table_name ||'_tmp_ext_wrt_'|| var_end_table;
        var_s3_connect = 'pxf://'|| p_s3_bucket 
        ||'/public/'||var_target_table_name || '/date_' || var_end_table 
        || '?PROFILE=s3:text&SERVER='|| p_s3_server_name 
        || '&COMPRESSION_CODEC=org.apache.hadoop.io.compress.GzipCodec&S3_SELECT=ON';
    
    var_sql_exec = ' DROP EXTERNAL TABLE if exists ' || var_ext_write_table_name || ' cascade;';
    RAISE NOTICE 'var_sql_exec  %', var_sql_exec;
    execute var_sql_exec;

    var_sql_exec = ' CREATE WRITABLE EXTERNAL TABLE ' || var_ext_write_table_name
        ||' ( LIKE ' || var_target_table_name || ') '
        ||' LOCATION ( ''' || var_s3_connect ||''' ) ON ALL FORMAT ''TEXT'' ( delimiter='','' ) ENCODING ''UTF8'';';
    RAISE NOTICE 'var_sql_exec  %', var_sql_exec;
    execute var_sql_exec;

    var_sql_exec =  ' INSERT INTO ' || var_ext_write_table_name 
        || ' SELECT  *  FROM   queries_history WHERE ctime >  ('''|| p_date_from || ''')::timestamp AND  ctime <= (''' || p_date_to || ''')::timestamp;';
    RAISE NOTICE 'var_sql_exec  %', var_sql_exec;
    execute var_sql_exec;
    var_sql_exec = ' DROP EXTERNAL TABLE if exists ' || var_ext_write_table_name || ' cascade;';
    RAISE NOTICE 'var_sql_exec  %', var_sql_exec;
    execute var_sql_exec;

end
$$;