CREATE EXTENSION IF NOT EXISTS pxf;

CREATE TABLE queries_history (
	ctime timestamp(0) NULL,
	tmid int4 NOT NULL,
	ssid int4 NOT NULL,
	ccnt int4 NOT NULL,
	username varchar(64) NOT NULL,
	db varchar(64) NOT NULL,
	"cost" int4 NOT NULL,
	tsubmit timestamp(0) NOT NULL,
	tstart timestamp(0) NULL,
	tfinish timestamp(0) NOT NULL,
	status varchar(64) NOT NULL,
	rows_out int8 NOT NULL,
	cpu_elapsed int8 NOT NULL,
	cpu_currpct float8 NOT NULL,
	skew_cpu float8 NOT NULL,
	skew_rows float8 NOT NULL,
	query_hash int8 NOT NULL,
	query_text text NOT NULL DEFAULT ''::text,
	query_plan text NOT NULL DEFAULT ''::text,
	application_name varchar(64) NULL,
	rsqname varchar(64) NULL,
	rqppriority varchar(16) NULL
)

DISTRIBUTED BY (ctime);



INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:07:15',1603984287,205547,3,'da.gstock','adb',0,'2020-11-01 00:00:09','2020-11-01 00:00:09','2020-11-01 00:06:54','abort',0,0,0.0,0.0,0.0,0,'select guaranteed_stock_mart.fn_get_features_delta();','','','Unknown','Unknown'),
	 ('2020-11-01 00:12:15',1603984287,206211,3,'marts_etlbot','adb',0,'2020-11-01 00:11:14','2020-11-01 00:11:14','2020-11-01 00:12:05','done',1,1070,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:15:30',1603984287,206480,3,'marts_etlbot','adb',0,'2020-11-01 00:14:54','2020-11-01 00:14:54','2020-11-01 00:15:14','done',1,990,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:26:00',1603984287,207112,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:25:12','2020-11-01 00:25:41','done',0,643990,0.0,0.07,1.45,0,'','','','',''),
	 ('2020-11-01 00:33:45',1603984287,207652,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:32:57','2020-11-01 00:33:32','done',0,671340,0.0,0.09,1.18,0,'','','','',''),
	 ('2020-11-01 00:33:45',1603984287,207458,3,'puz_etlbot','adb',0,'2020-11-01 00:30:12','2020-11-01 00:30:12','2020-11-01 00:33:28','done',1,850,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_services_item();','','','Unknown','Unknown'),
	 ('2020-11-01 01:05:00',1603984287,209770,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:04:03','2020-11-01 01:04:42','done',0,285660,0.0,1.09,2.52,0,'','','','',''),
	 ('2020-11-01 01:06:15',1603984287,209878,4,'payment_etlbot','adb',0,'2020-11-01 01:05:33','2020-11-01 01:05:33','2020-11-01 01:06:06','done',1,590,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:21:00',1603984287,210390,13,'findir_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:19:49','2020-11-01 01:20:39','done',0,3854300,0.0,0.04,0.03,0,'','','','',''),
	 ('2020-11-01 01:29:15',1603984287,211243,4,'tpnet_etlbot','adb',0,'2020-11-01 01:26:59','2020-11-01 01:26:59','2020-11-01 01:29:05','done',1,760,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:32:45',1603984287,211434,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:31:10','2020-11-01 01:32:26','done',0,256730,0.0,1.19,2.01,0,'','','','',''),
	 ('2020-11-01 01:37:30',1603984287,211741,3,'marts_etlbot','adb',0,'2020-11-01 01:35:59','2020-11-01 01:35:59','2020-11-01 01:37:14','done',1,930,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:41:30',1603984287,211831,3,'marts_etlbot','adb',0,'2020-11-01 01:37:44','2020-11-01 01:37:44','2020-11-01 01:41:17','done',1,9230,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-22''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:30',1603984287,212608,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:32','2020-11-01 01:53:32','2020-11-01 01:54:21','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 53'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00053_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00053_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 53'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:07:45',1603984287,205951,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 00:06:56','2020-11-01 00:06:56','2020-11-01 00:07:27','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:15:45',1603984287,206491,4,'tpnet_etlbot','adb',0,'2020-11-01 00:15:12','2020-11-01 00:15:12','2020-11-01 00:15:34','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 38'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00038_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00038_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 38'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:42:00',1603984287,208152,3,'marts_etlbot','adb',0,'2020-11-01 00:40:19','2020-11-01 00:40:19','2020-11-01 00:41:43','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-15''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:03:45',1603984287,209685,3,'crm_etlbot','adb',0,'2020-11-01 01:02:32','2020-11-01 01:02:32','2020-11-01 01:03:32','done',1,700,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_detail_call_transfers_delta();','','','Unknown','Unknown'),
	 ('2020-11-01 01:03:45',1603984287,209533,45,'findir_etlbot','adb',0,'2020-11-01 01:02:56','2020-11-01 01:02:56','2020-11-01 01:03:36','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 01:05:30',1603984287,209770,3,'marts_etlbot','adb',0,'2020-11-01 01:03:48','2020-11-01 01:03:48','2020-11-01 01:05:14','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-18''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:36:30',1603984287,207503,3,'puz_etlbot','adb',0,'2020-11-01 00:30:39','2020-11-01 00:30:39','2020-11-01 00:36:22','done',1,2320,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_order_product();','','','Unknown','Unknown'),
	 ('2020-11-01 00:37:45',1603984287,207927,4,'crm_etlbot','adb',0,'2020-11-01 00:36:57','2020-11-01 00:36:57','2020-11-01 00:37:36','done',1,1610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''opportunitybase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''opportunitybase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:48:15',1603984287,208658,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:47:35','2020-11-01 00:48:04','done',0,631720,0.0,0.08,0.9,0,'','','','',''),
	 ('2020-11-01 00:55:00',1603984287,209116,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:54:13','2020-11-01 00:54:43','done',0,658050,0.0,0.08,1.17,0,'','','','',''),
	 ('2020-11-01 00:59:00',1603984287,209367,4,'bpm_etlbot','adb',0,'2020-11-01 00:57:55','2020-11-01 00:57:55','2020-11-01 00:58:50','done',1,630,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Nautilus'' and stl.table_name = ''casemessagehistory'';
                                    select metadata.fn_load_all_table(''bpm_pruitsmdb_nautilus_raw'', 
                                                                      ''bpm_pruitsmdb_nautilus_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Nautilus'' and stl.table_name = ''casemessagehistory'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:04:30',1603984287,209533,53,'findir_etlbot','adb',0,'2020-11-01 01:03:45','2020-11-01 01:03:45','2020-11-01 01:04:08','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 00:01:30',1603984287,205549,3,'da.gstock','adb',0,'2020-11-01 00:00:13','2020-11-01 00:00:13','2020-11-01 00:01:10','done',1,480,0.0,0.0,0.0,0,'select guaranteed_stock_ods.fn_merge_items_on_expo();','','','Unknown','Unknown'),
	 ('2020-11-01 00:04:00',1603984287,205705,4,'crm_etlbot','adb',0,'2020-11-01 00:02:52','2020-11-01 00:02:52','2020-11-01 00:03:45','done',1,1260,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:04:00',1603984287,205706,3,'marts_etlbot','adb',0,'2020-11-01 00:02:57','2020-11-01 00:02:57','2020-11-01 00:03:43','done',1,1030,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:08:00',1603984287,205922,3,'marts_etlbot','adb',0,'2020-11-01 00:06:26','2020-11-01 00:06:26','2020-11-01 00:07:49','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-11''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:17:00',1603984287,206487,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:15:25','2020-11-01 00:16:38','done',0,219670,0.0,0.97,0.41,0,'','','','',''),
	 ('2020-11-01 00:31:00',1603984287,207458,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:30:12','2020-11-01 00:30:48','done',0,12100,0.0,0.05,0.06,0,'','','','',''),
	 ('2020-11-01 00:46:15',1603984287,208509,3,'marts_etlbot','adb',0,'2020-11-01 00:45:22','2020-11-01 00:45:22','2020-11-01 00:45:55','done',1,9740,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-16''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:46:15',1603984287,208506,3,'marts_etlbot','adb',0,'2020-11-01 00:45:20','2020-11-01 00:45:20','2020-11-01 00:46:01','done',1,21150,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-16''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:03:15',1603984287,209533,43,'findir_etlbot','adb',0,'2020-11-01 01:01:48','2020-11-01 01:01:48','2020-11-01 01:02:56','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 01:12:00',1603984287,210250,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:11:11','2020-11-01 01:11:42','done',0,663630,0.0,0.05,1.33,0,'','','','',''),
	 ('2020-11-01 01:17:00',1603984287,210605,3,'marts_etlbot','adb',0,'2020-11-01 01:16:03','2020-11-01 01:16:03','2020-11-01 01:16:45','done',1,8590,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-20''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:31:15',1603984287,207496,3,'marts_etlbot','adb',0,'2020-11-01 00:30:31','2020-11-01 00:30:31','2020-11-01 00:31:04','done',1,8380,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-14''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:36:15',1603984287,207697,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:33:35','2020-11-01 00:36:06','done',0,184740,0.0,0.63,2.67,0,'','','','',''),
	 ('2020-11-01 01:36:30',1603984287,211725,4,'cds_etlbot','adb',0,'2020-11-01 01:35:37','2020-11-01 01:35:37','2020-11-01 01:36:17','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_status_history'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_status_history'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:56:45',1603984287,212679,4,'tpnet_etlbot','adb',0,'2020-11-01 01:55:33','2020-11-01 01:55:33','2020-11-01 01:56:25','done',1,670,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 21'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00021_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00021_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 21'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:08:45',1603984287,213095,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:05:31','2020-11-01 02:08:24','done',0,275570,0.0,0.9,0.52,0,'','','','',''),
	 ('2020-11-01 02:08:45',1603984287,213204,4,'tpnet_etlbot','adb',0,'2020-11-01 02:07:33','2020-11-01 02:07:33','2020-11-01 02:08:30','done',1,670,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00036_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00036_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:43:30',1603984287,214942,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:41:14','2020-11-01 02:43:19','done',0,3800,0.0,2.86,1.49,0,'','','','',''),
	 ('2020-11-01 02:45:00',1603984287,214986,3,'marts_etlbot','adb',0,'2020-11-01 02:42:04','2020-11-01 02:42:04','2020-11-01 02:44:44','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-28''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:51:45',1603984287,215416,3,'marts_etlbot','adb',0,'2020-11-01 02:50:45','2020-11-01 02:50:45','2020-11-01 02:51:28','done',1,930,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:57:15',1603984287,215707,3,'marts_etlbot','adb',0,'2020-11-01 02:56:22','2020-11-01 02:56:22','2020-11-01 02:56:59','done',1,9540,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-30''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:59:15',1603984287,215812,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:58:30','2020-11-01 02:59:05','done',0,656530,0.0,0.06,0.9,0,'','','','',''),
	 ('2020-11-01 02:59:15',1603984287,213641,156,'findir_etlbot','adb',0,'2020-11-01 02:39:47','2020-11-01 02:39:47','2020-11-01 02:59:05','done',1,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 03:07:00',1603984287,216282,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 03:06:17','2020-11-01 03:06:51','done',0,516040,0.0,0.1,1.41,0,'','','','','');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:15:45',1603984287,216758,3,'marts_etlbot','adb',0,'2020-11-01 03:13:53','2020-11-01 03:13:53','2020-11-01 03:15:32','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-02''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:23:00',1603984287,206153,4,'crm_etlbot','adb',0,'2020-11-01 00:10:10','2020-11-01 00:10:10','2020-11-01 00:22:52','done',1,1840,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''activitypointerbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''activitypointerbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:40:30',1603984287,208103,4,'crm_etlbot','adb',0,'2020-11-01 00:39:28','2020-11-01 00:39:28','2020-11-01 00:40:20','done',1,1300,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_auditbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_auditbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:51:30',1603984287,208901,3,'marts_etlbot','adb',0,'2020-11-01 00:50:47','2020-11-01 00:50:47','2020-11-01 00:51:23','done',1,950,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:08:15',1603984287,209856,4,'payment_etlbot','adb',0,'2020-11-01 01:05:13','2020-11-01 01:05:13','2020-11-01 01:07:54','done',1,710,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:17:45',1603984287,210390,7,'findir_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:16:52','2020-11-01 01:17:32','done',0,2840650,0.0,0.05,0.05,0,'','','','',''),
	 ('2020-11-01 01:17:45',1603984287,210626,4,'payment_etlbot','adb',0,'2020-11-01 01:16:26','2020-11-01 01:16:26','2020-11-01 01:17:29','done',1,620,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:00',1603984287,209608,4,'crm_etlbot','adb',0,'2020-11-01 01:01:12','2020-11-01 01:01:12','2020-11-01 01:01:42','done',1,1360,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''annotationbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''annotationbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:00',1603984287,209533,41,'findir_etlbot','adb',0,'2020-11-01 01:00:44','2020-11-01 01:00:44','2020-11-01 01:01:48','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:00',1603984287,209478,3,'crm_etlbot','adb',0,'2020-11-01 00:59:27','2020-11-01 00:59:27','2020-11-01 01:01:43','done',1,2180,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_incidents_delta();','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:05:15',1603984287,209533,57,'findir_etlbot','adb',0,'2020-11-01 01:04:15','2020-11-01 01:04:15','2020-11-01 01:05:01','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 00:08:45',1603984287,206034,4,'pricemonitoringv_etlbot','adb',0,'2020-11-01 00:08:07','2020-11-01 00:08:07','2020-11-01 00:08:30','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''PriceMonitoring'' and stl.table_name = ''lm_storeprices'';
                                    select metadata.fn_load_all_table(''pricemonitoringv2_raw'', 
                                                                      ''pricemonitoringv2_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''PriceMonitoring'' and stl.table_name = ''lm_storeprices'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:23:15',1603984287,206969,4,'tpnet_etlbot','adb',0,'2020-11-01 00:22:30','2020-11-01 00:22:30','2020-11-01 00:22:59','done',1,760,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 80'' and stl.table_name = ''txlm_efttransaction'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00080_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00080_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 80'' and stl.table_name = ''txlm_efttransaction'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:30:15',1603984287,207020,3,'da.gstock','adb',0,'2020-11-01 00:23:39','2020-11-01 00:23:39','2020-11-01 00:29:57','abort',0,0,0.0,0.0,0.0,0,'select guaranteed_stock_mart.fn_get_features_delta();','','','Unknown','Unknown'),
	 ('2020-11-01 00:37:30',1603984287,207899,3,'marts_etlbot','adb',0,'2020-11-01 00:36:28','2020-11-01 00:36:28','2020-11-01 00:37:22','done',1,970,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:37:30',1603984287,207901,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:36:30','2020-11-01 00:37:10','done',0,6140,0.0,3.26,1.76,0,'','','','',''),
	 ('2020-11-01 00:37:30',1603984287,207901,3,'puz_etlbot','adb',0,'2020-11-01 00:36:30','2020-11-01 00:36:30','2020-11-01 00:37:19','done',1,0,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_invoice();','','','Unknown','Unknown'),
	 ('2020-11-01 00:39:00',1603984287,207993,3,'marts_etlbot','adb',0,'2020-11-01 00:38:00','2020-11-01 00:38:00','2020-11-01 00:38:41','done',1,20200,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-15''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:41:45',1603984287,207697,3,'puz_etlbot','adb',0,'2020-11-01 00:33:35','2020-11-01 00:33:35','2020-11-01 00:41:28','done',1,10970,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_order();','','','Unknown','Unknown'),
	 ('2020-11-01 00:45:00',1603984287,208414,3,'marts_etlbot','adb',0,'2020-11-01 00:44:09','2020-11-01 00:44:09','2020-11-01 00:44:46','done',1,910,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:03:00',1603984287,209663,4,'nav_etlbot','adb',0,'2020-11-01 01:02:15','2020-11-01 01:02:15','2020-11-01 01:02:48','done',1,1920,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:16:15',1603984287,206507,4,'tpnet_etlbot','adb',0,'2020-11-01 00:15:15','2020-11-01 00:15:15','2020-11-01 00:16:04','done',1,710,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 38'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00038_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00038_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 38'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:31:30',1603984287,207456,3,'dostovernost_etlbot','adb',0,'2020-11-01 00:30:08','2020-11-01 00:30:08','2020-11-01 00:31:18','done',1,780,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 00:31:30',1603984287,207489,3,'marts_etlbot','adb',0,'2020-11-01 00:30:30','2020-11-01 00:30:30','2020-11-01 00:31:13','done',1,23800,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-14''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:00:00',1603984287,209434,3,'marts_etlbot','adb',0,'2020-11-01 00:58:54','2020-11-01 00:58:54','2020-11-01 00:59:50','done',1,1000,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:00:30',1603984287,209442,4,'bpm_etlbot','adb',0,'2020-11-01 00:58:57','2020-11-01 00:58:57','2020-11-01 01:00:19','done',1,760,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Nautilus'' and stl.table_name = ''case'';
                                    select metadata.fn_load_all_table(''bpm_pruitsmdb_nautilus_raw'', 
                                                                      ''bpm_pruitsmdb_nautilus_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Nautilus'' and stl.table_name = ''case'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:01:30',1603984287,209581,4,'tpnet_etlbot','adb',0,'2020-11-01 01:00:48','2020-11-01 01:00:48','2020-11-01 01:01:09','done',1,650,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 115'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00115_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00115_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 115'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:42:15',1603984287,212015,4,'tpnet_etlbot','adb',0,'2020-11-01 01:41:38','2020-11-01 01:41:38','2020-11-01 01:41:59','done',1,620,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 31'' and stl.table_name = ''txlm_efttransaction'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00031_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00031_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 31'' and stl.table_name = ''txlm_efttransaction'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:44:00',1603984287,212063,3,'marts_etlbot','adb',0,'2020-11-01 01:42:41','2020-11-01 01:42:41','2020-11-01 01:43:49','done',1,1100,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-22''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:05:15',1603984287,205799,3,'marts_etlbot','adb',0,'2020-11-01 00:04:15','2020-11-01 00:04:15','2020-11-01 00:04:59','done',1,10560,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-11''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:05:15',1603984287,205769,4,'crm_etlbot','adb',0,'2020-11-01 00:03:56','2020-11-01 00:03:56','2020-11-01 00:04:56','done',1,1400,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postregardingbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postregardingbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:05:15',1603984287,205798,3,'marts_etlbot','adb',0,'2020-11-01 00:04:15','2020-11-01 00:04:15','2020-11-01 00:05:06','done',1,22050,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-11''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:05:30',1603984287,205829,4,'tpnet_etlbot','adb',0,'2020-11-01 00:04:52','2020-11-01 00:04:52','2020-11-01 00:05:20','done',1,910,0.0,0.0,0.27,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 46'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00046_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00046_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 46'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:05:45',1603984287,205835,4,'tpnet_etlbot','adb',0,'2020-11-01 00:04:52','2020-11-01 00:04:52','2020-11-01 00:05:24','done',1,810,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 49'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00049_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00049_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 49'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:05:45',1603984287,205820,4,'tpnet_etlbot','adb',0,'2020-11-01 00:04:47','2020-11-01 00:04:47','2020-11-01 00:05:38','done',1,650,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 65'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00065_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00065_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 65'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:13:30',1603984287,206323,3,'marts_etlbot','adb',0,'2020-11-01 00:12:34','2020-11-01 00:12:34','2020-11-01 00:13:09','done',1,9130,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:13:30',1603984287,206322,3,'marts_etlbot','adb',0,'2020-11-01 00:12:34','2020-11-01 00:12:34','2020-11-01 00:13:20','done',1,24920,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:15:00',1603984287,206027,3,'da.gstock','adb',0,'2020-11-01 00:08:00','2020-11-01 00:08:00','2020-11-01 00:14:38','abort',0,0,0.0,0.0,0.0,0,'select guaranteed_stock_mart.fn_get_features_delta();','','','Unknown','Unknown'),
	 ('2020-11-01 00:18:30',1603984287,206487,3,'marts_etlbot','adb',0,'2020-11-01 00:15:08','2020-11-01 00:15:08','2020-11-01 00:18:11','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:22:45',1603984287,206529,3,'da.gstock','adb',0,'2020-11-01 00:15:44','2020-11-01 00:15:44','2020-11-01 00:22:28','abort',0,0,0.0,0.0,0.0,0,'select guaranteed_stock_mart.fn_get_features_delta();','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:41:30',1603984287,208152,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:40:35','2020-11-01 00:41:14','done',0,672520,0.0,0.16,1.22,0,'','','','',''),
	 ('2020-11-01 00:52:45',1603984287,208979,3,'marts_etlbot','adb',0,'2020-11-01 00:52:02','2020-11-01 00:52:02','2020-11-01 00:52:32','done',1,9840,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-17''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:52:45',1603984287,208978,3,'marts_etlbot','adb',0,'2020-11-01 00:52:01','2020-11-01 00:52:01','2020-11-01 00:52:37','done',1,21690,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-17''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:58:30',1603984287,209091,4,'crm_etlbot','adb',0,'2020-11-01 00:53:38','2020-11-01 00:53:38','2020-11-01 00:58:11','done',1,1600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''contactbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''contactbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:14:15',1603984287,210264,4,'cds_etlbot','adb',0,'2020-11-01 01:11:05','2020-11-01 01:11:05','2020-11-01 01:14:04','done',1,710,0.0,2.69,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:14:15',1603984287,210439,4,'tpnet_etlbot','adb',0,'2020-11-01 01:13:31','2020-11-01 01:13:31','2020-11-01 01:13:56','done',1,710,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 9'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00009_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00009_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 9'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:19:00',1603984287,210390,9,'findir_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:17:35','2020-11-01 01:18:41','done',0,3270460,0.0,0.05,0.03,0,'','','','',''),
	 ('2020-11-01 01:19:00',1603984287,210747,3,'marts_etlbot','adb',0,'2020-11-01 01:18:11','2020-11-01 01:18:11','2020-11-01 01:18:43','done',1,1010,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-20''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:22:30',1603984287,210952,3,'findir_etlbot','adb',0,'2020-11-01 01:21:08','2020-11-01 01:21:08','2020-11-01 01:22:17','done',1,1720,0.0,0.0,0.0,0,'select findir_marts.fn_load_jour_item_sales(''2020-10-29''::date, ''2020-10-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:23:30',1603984287,211018,3,'findir_etlbot','adb',0,'2020-11-01 01:22:31','2020-11-01 01:22:31','2020-11-01 01:23:18','done',1,1330,0.0,0.0,0.0,0,'select findir_marts.fn_load_fin_targets(''2020-10-29''::date, ''2020-10-29''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:06:00',1603984287,205855,4,'tpnet_etlbot','adb',0,'2020-11-01 00:05:28','2020-11-01 00:05:28','2020-11-01 00:05:48','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 65'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00065_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00065_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 65'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:06:00',1603984287,205853,4,'tpnet_etlbot','adb',0,'2020-11-01 00:05:26','2020-11-01 00:05:26','2020-11-01 00:05:47','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 51'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00051_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00051_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 51'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:06:00',1603984287,205821,4,'tpnet_etlbot','adb',0,'2020-11-01 00:04:47','2020-11-01 00:04:47','2020-11-01 00:05:39','done',1,710,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 51'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00051_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00051_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 51'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:10:00',1603984287,206078,4,'crm_etlbot','adb',0,'2020-11-01 00:08:51','2020-11-01 00:08:51','2020-11-01 00:09:45','done',1,1330,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''slakpiinstancebase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''slakpiinstancebase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:06:00',1603984287,209533,59,'findir_etlbot','adb',0,'2020-11-01 01:05:01','2020-11-01 01:05:01','2020-11-01 01:05:40','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 01:15:45',1603984287,210305,4,'cds_etlbot','adb',0,'2020-11-01 01:11:37','2020-11-01 01:11:37','2020-11-01 01:15:23','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:15:45',1603984287,210509,3,'marts_etlbot','adb',0,'2020-11-01 01:14:40','2020-11-01 01:14:40','2020-11-01 01:15:32','done',1,990,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:31:00',1603984287,210413,3,'findir_etlbot','adb',0,'2020-11-01 01:13:01','2020-11-01 01:13:01','2020-11-01 01:30:52','done',1,11140,0.0,0.0,0.0,0,'select findir_marts.fn_load_reg_item_stk_gam(''2020-10-29''::date, ''2020-10-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:31:15',1603984287,211442,4,'tpnet_etlbot','adb',0,'2020-11-01 01:30:45','2020-11-01 01:30:45','2020-11-01 01:31:07','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 33'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00033_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00033_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 33'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:31:45',1603984287,211413,3,'marts_etlbot','adb',0,'2020-11-01 01:30:11','2020-11-01 01:30:11','2020-11-01 01:31:26','done',1,990,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-21''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:31:45',1603984287,211466,5,'findir_etlbot','adb',0,'2020-11-01 01:31:05','2020-11-01 01:31:05','2020-11-01 01:31:37','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''findir_marts'',''jour_item_sales'');select public.fn_analyze_table(''findir_marts'',''reg_dep_targets_by_day'');select public.fn_analyze_table(''findir_marts'',''reg_dep_targets_by_month'');select public.fn_analyze_table(''findir_marts'',''reg_item_stk_gam'');select public.fn_analyze_table(''findir_marts'',''reg_item_store_sup_attr'');select public.fn_analyze_table(''findir_marts'',''reg_store_lfl'');select public.fn_analyze_table(''findir_marts'',''reg_store_targets_by_day'');select public.fn_analyze_table(''findir_marts'',''reg_subdep_targets_by_month'');','','','Unknown','Unknown'),
	 ('2020-11-01 01:41:00',1603984287,211790,4,'tpnet_etlbot','adb',0,'2020-11-01 01:37:09','2020-11-01 01:37:09','2020-11-01 01:40:46','done',1,730,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00006_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00006_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:55:45',1603984287,212611,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:32','2020-11-01 01:53:32','2020-11-01 01:55:33','done',1,670,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00005_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00005_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:03:00',1603984287,212889,4,'tpnet_etlbot','adb',0,'2020-11-01 02:00:35','2020-11-01 02:00:35','2020-11-01 02:02:44','done',1,730,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:03:30',1603984287,212979,3,'marts_etlbot','adb',0,'2020-11-01 02:02:27','2020-11-01 02:02:27','2020-11-01 02:03:15','done',1,9700,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-24''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:07:00',1603984287,213171,4,'tpnet_etlbot','adb',0,'2020-11-01 02:06:29','2020-11-01 02:06:29','2020-11-01 02:06:50','done',1,0,0.0,1.76,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_orderlines'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_orderlines'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:23:00',1603984287,216084,4,'crm_etlbot','adb',0,'2020-11-01 03:03:05','2020-11-01 03:03:05','2020-11-01 03:22:48','done',1,1880,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''incidentbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''incidentbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:31:00',1603984287,217611,3,'marts_etlbot','adb',0,'2020-11-01 03:29:08','2020-11-01 03:29:08','2020-11-01 03:30:41','done',1,22420,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-04''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:08:00',1603984287,220079,4,'tpnet_etlbot','adb',0,'2020-11-01 04:07:20','2020-11-01 04:07:20','2020-11-01 04:07:42','done',1,680,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_efttransaction'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_efttransaction'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:37:15',1603984287,221923,4,'payment_etlbot','adb',0,'2020-11-01 04:36:29','2020-11-01 04:36:29','2020-11-01 04:37:05','done',1,580,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 04:37:15',1603984287,221891,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 04:36:14','2020-11-01 04:36:56','done',0,177200,0.0,1.49,3.47,0,'','','','',''),
	 ('2020-11-01 04:38:30',1603984287,221998,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 04:37:57','2020-11-01 04:38:23','done',0,4810,0.0,2.18,1.62,0,'','','','',''),
	 ('2020-11-01 04:46:30',1603984287,222425,4,'payment_etlbot','adb',0,'2020-11-01 04:45:49','2020-11-01 04:45:49','2020-11-01 04:46:13','done',1,550,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:25:45',1603984287,211134,4,'tpnet_etlbot','adb',0,'2020-11-01 01:24:41','2020-11-01 01:24:41','2020-11-01 01:25:25','done',1,620,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:40:15',1603984287,211818,4,'tpnet_etlbot','adb',0,'2020-11-01 01:37:29','2020-11-01 01:37:29','2020-11-01 01:40:05','done',1,680,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txfooter'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00006_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00006_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txfooter'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:55:30',1603984287,212594,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:15','2020-11-01 01:53:15','2020-11-01 01:55:16','done',1,700,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00036_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00036_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:58:00',1603984287,212682,4,'tpnet_etlbot','adb',0,'2020-11-01 01:55:35','2020-11-01 01:55:35','2020-11-01 01:57:50','done',1,660,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00020_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00020_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:51:30',1603984287,212335,4,'payment_etlbot','adb',0,'2020-11-01 01:47:54','2020-11-01 01:47:54','2020-11-01 01:51:19','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:45',1603984287,212597,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:16','2020-11-01 01:53:16','2020-11-01 01:54:34','done',1,650,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00005_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00005_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:58:15',1603984287,212680,4,'tpnet_etlbot','adb',0,'2020-11-01 01:55:33','2020-11-01 01:55:33','2020-11-01 01:58:02','done',1,670,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00022_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00022_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:58:15',1603984287,212602,3,'marts_etlbot','adb',0,'2020-11-01 01:53:20','2020-11-01 01:53:20','2020-11-01 01:58:01','done',1,1140,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-23''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:58:15',1603984287,212739,4,'tpnet_etlbot','adb',0,'2020-11-01 01:57:10','2020-11-01 01:57:10','2020-11-01 01:57:58','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txtotal'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txtotal'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:58:15',1603984287,212617,3,'marts_etlbot','adb',0,'2020-11-01 01:53:45','2020-11-01 01:53:45','2020-11-01 01:57:54','done',1,1350,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-23''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:45',1603984287,211507,3,'findir_etlbot','adb',0,'2020-11-01 01:31:55','2020-11-01 01:31:55','2020-11-01 02:15:28','done',4,0,0.0,0.0,0.0,0,'SELECT findir_dq.fn_dq_build_cases_and_run_chain(''rms'',''2020-10-29''::date,35,110::text);','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:45',1603984287,211507,139,'findir_etlbot','adb',0,'2020-11-01 02:06:24','2020-11-01 02:06:24','2020-11-01 02:15:27','done',1,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 02:15:45',1603984287,211507,63,'findir_etlbot','adb',0,'2020-11-01 01:31:57','2020-11-01 01:31:57','2020-11-01 02:15:28','done',10,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 02:21:00',1603984287,213855,3,'marts_etlbot','adb',0,'2020-11-01 02:20:18','2020-11-01 02:20:18','2020-11-01 02:20:40','done',1,540,0.0,0.0,0.0,0,'select hi42_marts.fn_load_items();','','','Unknown','Unknown'),
	 ('2020-11-01 01:07:00',1603984287,209929,4,'tpnet_etlbot','adb',0,'2020-11-01 01:06:23','2020-11-01 01:06:23','2020-11-01 01:06:51','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00011_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00011_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:41:15',1603984287,211934,4,'tpnet_etlbot','adb',0,'2020-11-01 01:40:09','2020-11-01 01:40:09','2020-11-01 01:41:03','done',1,630,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00006_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00006_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:41:45',1603984287,211830,3,'marts_etlbot','adb',0,'2020-11-01 01:37:44','2020-11-01 01:37:44','2020-11-01 01:41:34','done',1,22140,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-22''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:05:45',1603984287,213089,4,'tpnet_etlbot','adb',0,'2020-11-01 02:04:41','2020-11-01 02:04:41','2020-11-01 02:05:36','done',1,630,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txdiscinfo'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txdiscinfo'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:07:45',1603984287,213167,4,'tpnet_etlbot','adb',0,'2020-11-01 02:06:28','2020-11-01 02:06:28','2020-11-01 02:07:28','done',1,730,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00005_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00005_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213038,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:48','2020-11-01 02:03:48','2020-11-01 02:04:18','done',1,0,0.0,2.69,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 171'' and stl.table_name = ''txlm_bvlines'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00171_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00171_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 171'' and stl.table_name = ''txlm_bvlines'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213042,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:18','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txlm_bvheader'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00023_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00023_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txlm_bvheader'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213046,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:19','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txlm_bvlines'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00023_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00023_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txlm_bvlines'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213041,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:17','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 176'' and stl.table_name = ''txlm_cancartpickup'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00176_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00176_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 176'' and stl.table_name = ''txlm_cancartpickup'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:30',1603984287,212610,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:32','2020-11-01 01:53:32','2020-11-01 01:54:22','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 56'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00056_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00056_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 56'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:30',1603984287,212612,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:33','2020-11-01 01:53:33','2020-11-01 01:54:21','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 57'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00057_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00057_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 57'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:30',1603984287,212609,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:32','2020-11-01 01:53:32','2020-11-01 01:54:21','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 52'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00052_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00052_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 52'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:30',1603984287,212613,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:33','2020-11-01 01:53:33','2020-11-01 01:54:21','done',1,0,0.0,2.11,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 55'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00055_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00055_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 55'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:32:30',1603984287,211203,4,'payment_etlbot','adb',0,'2020-11-01 01:25:53','2020-11-01 01:25:53','2020-11-01 01:32:20','done',1,700,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:51:15',1603984287,212437,4,'fulfillmentitr_etlbot','adb',0,'2020-11-01 01:50:01','2020-11-01 01:50:01','2020-11-01 01:51:06','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''FulfillmentITr'' and stl.table_name = ''fulfillmentinternaltransfer_task'';
                                    select metadata.fn_load_all_table(''fulfillmentitr_fulfillmentinternaltransfer_all_raw'', 
                                                                      ''fulfillmentitr_fulfillmentinternaltransfer_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''FulfillmentITr'' and stl.table_name = ''fulfillmentinternaltransfer_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:57:00',1603984287,212620,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:47','2020-11-01 01:53:47','2020-11-01 01:56:50','done',1,690,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00036_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00036_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:57:00',1603984287,212504,4,'cds_etlbot','adb',0,'2020-11-01 01:51:31','2020-11-01 01:51:31','2020-11-01 01:56:49','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:14:00',1603984287,213488,4,'tpnet_etlbot','adb',0,'2020-11-01 02:13:04','2020-11-01 02:13:04','2020-11-01 02:13:39','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 33'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00033_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00033_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 33'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:14:00',1603984287,213275,3,'findir_etlbot','adb',0,'2020-11-01 02:09:22','2020-11-01 02:09:22','2020-11-01 02:13:44','done',1,6260,0.0,0.0,0.0,0,'select findir_marts.fn_load_jour_item_trnv_deadstk_by_day(''2020-10-29''::date, ''2020-10-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:32:30',1603984287,214385,3,'dostovernost_etlbot','adb',0,'2020-11-01 02:30:09','2020-11-01 02:30:09','2020-11-01 02:32:21','done',1,770,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 02:44:30',1603984287,214986,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:42:27','2020-11-01 02:44:10','done',0,246760,0.0,1.24,2.58,0,'','','','',''),
	 ('2020-11-01 02:50:00',1603984287,215316,3,'marts_etlbot','adb',0,'2020-11-01 02:48:33','2020-11-01 02:48:33','2020-11-01 02:49:43','done',1,9600,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:57:30',1603984287,215708,3,'marts_etlbot','adb',0,'2020-11-01 02:56:22','2020-11-01 02:56:22','2020-11-01 02:57:10','done',1,20540,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-30''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:02:00',1603984287,215954,4,'pricemonitoringv_etlbot','adb',0,'2020-11-01 03:01:05','2020-11-01 03:01:05','2020-11-01 03:01:41','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''PriceMonitoring'' and stl.table_name = ''lm_monitoringresults'';
                                    select metadata.fn_load_all_table(''pricemonitoringv2_raw'', 
                                                                      ''pricemonitoringv2_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''PriceMonitoring'' and stl.table_name = ''lm_monitoringresults'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:02:00',1603984287,215929,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 03:00:45','2020-11-01 03:00:45','2020-11-01 03:01:47','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:02:00',1603984287,215919,3,'marts_etlbot','adb',0,'2020-11-01 03:00:20','2020-11-01 03:00:20','2020-11-01 03:01:39','done',1,310,0.0,0.0,0.0,0,'SELECT cards_tic_agg_marts.fn_load_from_ligticcai((''2020-10-31''::date - INTERVAL ''4 days'')::date, (''2020-10-31''::date - INTERVAL ''4 days'')::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:48:00',1603984287,222522,4,'payment_etlbot','adb',0,'2020-11-01 04:47:31','2020-11-01 04:47:31','2020-11-01 04:47:51','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:49:30',1603984287,222592,3,'marts_etlbot','adb',0,'2020-11-01 04:48:44','2020-11-01 04:48:44','2020-11-01 04:49:20','done',1,8730,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-15''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:49:30',1603984287,222485,4,'payment_etlbot','adb',0,'2020-11-01 04:46:45','2020-11-01 04:46:45','2020-11-01 04:49:15','done',1,620,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:04:45',1603984287,223378,3,'marts_etlbot','adb',0,'2020-11-01 05:02:40','2020-11-01 05:02:40','2020-11-01 05:04:28','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-17''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:12:15',1603984287,223757,3,'marts_etlbot','adb',0,'2020-11-01 05:09:54','2020-11-01 05:09:54','2020-11-01 05:11:55','done',1,990,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:13:00',1603984287,223716,4,'cds_etlbot','adb',0,'2020-11-01 05:09:05','2020-11-01 05:09:05','2020-11-01 05:12:43','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:25:00',1603984287,224544,3,'marts_etlbot','adb',0,'2020-11-01 05:23:59','2020-11-01 05:23:59','2020-11-01 05:24:44','done',1,1110,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 05:45:00',1603984287,225566,3,'marts_etlbot','adb',0,'2020-11-01 05:43:33','2020-11-01 05:43:33','2020-11-01 05:44:38','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-23''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:49:45',1603984287,225843,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 05:49:06','2020-11-01 05:49:37','done',0,489900,0.0,0.08,1.38,0,'','','','',''),
	 ('2020-11-01 06:08:00',1603984287,226815,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 06:07:00','2020-11-01 06:07:51','done',0,590400,0.0,0.1,1.24,0,'','','','',''),
	 ('2020-11-01 01:58:00',1603984287,212681,4,'tpnet_etlbot','adb',0,'2020-11-01 01:55:34','2020-11-01 01:55:34','2020-11-01 01:57:39','done',1,620,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00022_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00022_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:34:30',1603984287,214555,3,'marts_etlbot','adb',0,'2020-11-01 02:33:47','2020-11-01 02:33:47','2020-11-01 02:34:16','done',1,920,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-27''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:42:30',1603984287,214983,4,'tpnet_etlbot','adb',0,'2020-11-01 02:42:01','2020-11-01 02:42:01','2020-11-01 02:42:21','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00017_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00017_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:49:30',1603984287,215317,4,'tpnet_etlbot','adb',0,'2020-11-01 02:48:35','2020-11-01 02:48:35','2020-11-01 02:49:11','done',1,590,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00143_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00143_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:49:30',1603984287,215300,4,'tpnet_etlbot','adb',0,'2020-11-01 02:48:20','2020-11-01 02:48:20','2020-11-01 02:49:20','done',1,610,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00143_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00143_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:56:00',1603984287,215627,3,'marts_etlbot','adb',0,'2020-11-01 02:54:52','2020-11-01 02:54:52','2020-11-01 02:55:51','done',1,1000,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:07:45',1603984287,216282,3,'marts_etlbot','adb',0,'2020-11-01 03:06:12','2020-11-01 03:06:12','2020-11-01 03:07:26','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-01''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:30:15',1603984287,217638,4,'tpnet_etlbot','adb',0,'2020-11-01 03:29:31','2020-11-01 03:29:31','2020-11-01 03:29:54','done',1,850,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:30:15',1603984287,217642,4,'tpnet_etlbot','adb',0,'2020-11-01 03:29:31','2020-11-01 03:29:31','2020-11-01 03:30:06','done',1,740,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:30:15',1603984287,217666,4,'lynx_etlbot','adb',0,'2020-11-01 03:29:45','2020-11-01 03:29:45','2020-11-01 03:30:05','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''LYNX'' and stl.table_name = ''ap_hist_dpac'';
                                    select metadata.fn_load_all_table(''lynx_raw'', 
                                                                      ''lynx_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''LYNX'' and stl.table_name = ''ap_hist_dpac'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:30:15',1603984287,217632,4,'tpnet_etlbot','adb',0,'2020-11-01 03:29:29','2020-11-01 03:29:29','2020-11-01 03:30:08','done',1,640,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:07:45',1603984287,213195,4,'tpnet_etlbot','adb',0,'2020-11-01 02:07:16','2020-11-01 02:07:16','2020-11-01 02:07:38','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:09:15',1603984287,211511,3,'findir_etlbot','adb',0,'2020-11-01 01:31:59','2020-11-01 01:31:59','2020-11-01 02:08:54','done',1,4190,0.0,0.0,0.0,0,'select findir_marts.fn_abc_load_date(''2020-10-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:09:15',1603984287,213169,4,'tpnet_etlbot','adb',0,'2020-11-01 02:06:29','2020-11-01 02:06:29','2020-11-01 02:09:00','done',1,800,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txfooter'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txfooter'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:09:15',1603984287,213249,4,'tpnet_etlbot','adb',0,'2020-11-01 02:08:32','2020-11-01 02:08:32','2020-11-01 02:09:02','done',1,710,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txfooter'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00036_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00036_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txfooter'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:13:00',1603984287,212935,4,'payment_etlbot','adb',0,'2020-11-01 02:01:35','2020-11-01 02:01:35','2020-11-01 02:12:44','done',1,800,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:15',1603984287,213557,3,'marts_etlbot','adb',0,'2020-11-01 02:14:25','2020-11-01 02:14:25','2020-11-01 02:15:03','done',1,9020,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-25''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:04:30',1603984287,213045,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:19','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txlm_bvlines'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00018_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00018_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txlm_bvlines'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213049,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:17','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txlm_cancartpickup'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00023_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00023_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txlm_cancartpickup'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213040,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:17','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txlm_cancartpickup'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00018_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00018_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txlm_cancartpickup'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213044,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:19','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''txlm_bvlines'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00017_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00017_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''txlm_bvlines'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:26:45',1603984287,211221,4,'tpnet_etlbot','adb',0,'2020-11-01 01:26:17','2020-11-01 01:26:17','2020-11-01 01:26:38','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:26:45',1603984287,211129,3,'marts_etlbot','adb',0,'2020-11-01 01:24:41','2020-11-01 01:24:41','2020-11-01 01:26:33','done',1,980,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:26:45',1603984287,210983,4,'cds_etlbot','adb',0,'2020-11-01 01:21:56','2020-11-01 01:21:56','2020-11-01 01:26:24','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:28:30',1603984287,211289,4,'tpnet_etlbot','adb',0,'2020-11-01 01:27:39','2020-11-01 01:27:39','2020-11-01 01:28:21','done',1,600,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txfooter'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txfooter'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:39:30',1603984287,211864,4,'tpnet_etlbot','adb',0,'2020-11-01 01:38:39','2020-11-01 01:38:39','2020-11-01 01:39:12','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00006_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00006_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:11:00',1603984287,205633,4,'crm_etlbot','adb',0,'2020-11-01 00:01:53','2020-11-01 00:01:53','2020-11-01 00:10:43','done',1,1690,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''incidentbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''incidentbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:29:45',1603984287,207374,3,'marts_etlbot','adb',0,'2020-11-01 00:29:01','2020-11-01 00:29:01','2020-11-01 00:29:37','done',1,1040,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:12:30',1603984287,210250,3,'marts_etlbot','adb',0,'2020-11-01 01:10:55','2020-11-01 01:10:55','2020-11-01 01:12:13','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-19''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:52:30',1603984287,212506,4,'serviceplatform_etlbot','adb',0,'2020-11-01 01:51:31','2020-11-01 01:51:31','2020-11-01 01:52:11','done',1,550,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''ServicesPlatform'' and stl.table_name = ''servicebroker_service_task'';
                                    select metadata.fn_load_all_table(''serviceplatform_service_broker_all_raw'', 
                                                                      ''serviceplatform_service_broker_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''ServicesPlatform'' and stl.table_name = ''servicebroker_service_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:52:30',1603984287,212444,3,'marts_etlbot','adb',0,'2020-11-01 01:50:10','2020-11-01 01:50:10','2020-11-01 01:52:11','done',1,8820,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-23''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:57:30',1603984287,212617,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:55:51','2020-11-01 01:57:19','done',0,263490,0.0,1.09,0.65,0,'','','','',''),
	 ('2020-11-01 02:02:15',1603984287,212915,4,'tpnet_etlbot','adb',0,'2020-11-01 02:01:10','2020-11-01 02:01:10','2020-11-01 02:01:59','done',1,650,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txfooter'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txfooter'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:03:45',1603984287,212977,3,'marts_etlbot','adb',0,'2020-11-01 02:02:25','2020-11-01 02:02:25','2020-11-01 02:03:29','done',1,21880,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-24''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:06:30',1603984287,213077,3,'marts_etlbot','adb',0,'2020-11-01 02:04:30','2020-11-01 02:04:30','2020-11-01 02:06:11','done',1,1020,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-24''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:54:30',1603984287,212621,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:47','2020-11-01 01:53:47','2020-11-01 01:54:21','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 37'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00037_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00037_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 37'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:58:30',1603984287,212689,4,'tpnet_etlbot','adb',0,'2020-11-01 01:55:50','2020-11-01 01:55:50','2020-11-01 01:58:08','done',1,670,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00020_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00020_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:58:30',1603984287,212738,4,'tpnet_etlbot','adb',0,'2020-11-01 01:57:10','2020-11-01 01:57:10','2020-11-01 01:58:15','done',1,620,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:08:00',1603984287,213197,4,'tpnet_etlbot','adb',0,'2020-11-01 02:07:16','2020-11-01 02:07:16','2020-11-01 02:07:41','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00005_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00005_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 5'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:19:15',1603984287,210776,4,'payment_etlbot','adb',0,'2020-11-01 01:18:37','2020-11-01 01:18:37','2020-11-01 01:19:05','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:19:30',1603984287,210390,10,'findir_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:18:41','2020-11-01 01:19:20','done',0,3577490,0.0,0.07,0.08,0,'','','','',''),
	 ('2020-11-01 01:21:15',1603984287,210390,3,'findir_etlbot','adb',0,'2020-11-01 01:12:45','2020-11-01 01:12:45','2020-11-01 01:20:57','done',1,3060,0.0,0.0,0.0,0,'select findir_marts.fn_load_reg_item_store_sup_attr(''2020-10-29''::date, ''2020-10-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:29:30',1603984287,211284,3,'marts_etlbot','adb',0,'2020-11-01 01:27:27','2020-11-01 01:27:27','2020-11-01 01:29:21','done',1,20260,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-21''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:29:30',1603984287,211320,4,'tpnet_etlbot','adb',0,'2020-11-01 01:28:28','2020-11-01 01:28:28','2020-11-01 01:29:09','done',1,670,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:29:30',1603984287,211283,3,'marts_etlbot','adb',0,'2020-11-01 01:27:27','2020-11-01 01:27:27','2020-11-01 01:29:08','done',1,9390,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-21''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:32:00',1603984287,211416,3,'dostovernost_etlbot','adb',0,'2020-11-01 01:30:13','2020-11-01 01:30:13','2020-11-01 01:31:38','done',1,760,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 01:33:15',1603984287,211513,3,'findir_etlbot','adb',0,'2020-11-01 01:32:01','2020-11-01 01:32:01','2020-11-01 01:32:57','done',1,14520,0.0,0.0,0.0,0,'select findir_marts.fn_load_attractivity(''2020-10-29''::date, ''2020-10-29''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:33:15',1603984287,211434,3,'marts_etlbot','adb',0,'2020-11-01 01:30:32','2020-11-01 01:30:32','2020-11-01 01:33:01','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-21''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:48:30',1603984287,212304,4,'payment_etlbot','adb',0,'2020-11-01 01:47:32','2020-11-01 01:47:32','2020-11-01 01:48:09','done',1,590,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:06:45',1603984287,211507,114,'findir_etlbot','adb',0,'2020-11-01 01:31:57','2020-11-01 01:31:57','2020-11-01 02:06:24','done',1,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 01:57:00',1603984287,212683,4,'tpnet_etlbot','adb',0,'2020-11-01 01:55:35','2020-11-01 01:55:35','2020-11-01 01:56:41','done',1,660,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 21'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00021_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00021_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 21'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:01:30',1603984287,212897,4,'tpnet_etlbot','adb',0,'2020-11-01 02:00:35','2020-11-01 02:00:35','2020-11-01 02:01:17','done',1,740,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_ftrextrec'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_ftrextrec'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:01:30',1603984287,212883,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 02:00:25','2020-11-01 02:00:25','2020-11-01 02:01:12','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:19:15',1603984287,213641,105,'findir_etlbot','adb',0,'2020-11-01 02:17:34','2020-11-01 02:17:34','2020-11-01 02:19:04','done',1,0,0.0,0.0,0.0,0,'(select *
from findir_dq.fn_dq_run_case(case_num._case_id))','','','Unknown','Unknown'),
	 ('2020-11-01 02:22:15',1603984287,213927,4,'quotation_etlbot','adb',0,'2020-11-01 02:21:32','2020-11-01 02:21:32','2020-11-01 02:22:04','done',1,1940,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'';
                                    select metadata.fn_load_all_table(''quotation_quotation_all_raw'', 
                                                                      ''quotation_quotation_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:33:15',1603984287,214432,3,'marts_etlbot','adb',0,'2020-11-01 02:31:10','2020-11-01 02:31:10','2020-11-01 02:32:56','done',1,19870,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-27''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:10:45',1603984287,216487,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 03:09:31','2020-11-01 03:09:31','2020-11-01 03:10:29','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:11:00',1603984287,216483,1,'t-greenplum-svc','adb',0,'2020-11-01 03:09:20','2020-11-01 03:09:20','2020-11-01 03:10:47','done',7433765,444950,0.0,2.45,0.9,0,'select
	cast(ilt.item as text) as product_code,
	substring(ilt.in_store_market_basket from 4) as top,
	cast(ilt.loc as text) as store_id
from
	rms_p009qtzb_rms_ods.v_ITEM_LOC_TRAITS ilt
	left join rms_p009qtzb_rms_ods.v_item_loc_soh ils on ilt.item = ils.item and ilt.loc = ils.loc and ils.loc_type = ''S'' and ils.is_actual = ''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty c3 on c3.item = ils.item and c3.location = ils.loc and c3.inv_status = 6 and c3.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty whb on whb.item = ils.item and whb.location = ils.loc and whb.inv_status = 8 and whb.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty whbp on whbp.item = ils.item and whbp.location = ils.loc and whbp.inv_status = 9 and whbp.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty tbc on tbc.item = ils.item and tbc.location = ils.loc and tbc.inv_status = 10 and tbc.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty uts on uts.item = ils.item and uts.location = ils.loc and uts.inv_status = 2 and uts.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty utsp on utsp.item = ils.item and utsp.location = ils.loc and utsp.inv_status = 11 and utsp.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty cor on cor.item = ils.item and cor.location = ils.loc and cor.inv_status = 1 and cor.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_repl_item_loc ril on ril.item = ils.item and ril.location = ils.loc and ril.is_actual=''1''
	inner join rms_p009qtzb_rms_ods.v_item_master im on im.item = ilt.item and im.is_actual = ''1''
where
	ilt.is_actual = ''1'' 
	and (
		ils.stock_on_hand <> 0 or
		coalesce(ril.demo_stock, 0) <> 0 or
		coalesce(c3.qty, 0) <> 0 or
		coalesce(ils.rtv_qty, 0) <> 0 or 
		coalesce(ils.tsf_reserved_qty, 0) <> 0 or
		coalesce(whb.qty, 0) <> 0 or 
		coalesce(whbp.qty, 0) <> 0 or
		coalesce(tbc.qty, 0) <> 0 or 
		coalesce(uts.qty, 0) <> 0 or
		coalesce(utsp.qty, 0) <> 0 or
		coalesce(cor.qty, 0) <> 0 or
		ilt.in_store_market_basket <> ''TOP0''
	)
	and ilt.in_store_market_basket is not null;','','','Unknown','Unknown'),
	 ('2020-11-01 03:14:15',1603984287,216753,3,'marts_etlbot','adb',0,'2020-11-01 03:13:43','2020-11-01 03:13:43','2020-11-01 03:14:03','done',1,950,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-10-02''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:25:30',1603984287,217214,3,'marts_etlbot','adb',0,'2020-11-01 03:22:25','2020-11-01 03:22:25','2020-11-01 03:25:23','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-03''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:36:45',1603984287,218014,3,'marts_etlbot','adb',0,'2020-11-01 03:35:33','2020-11-01 03:35:33','2020-11-01 03:36:26','done',1,1020,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:38:30',1603984287,218174,4,'nav_etlbot','adb',0,'2020-11-01 03:37:48','2020-11-01 03:37:48','2020-11-01 03:38:08','done',1,1920,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__unit_line'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__unit_line'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:57:00',1603984287,219312,3,'marts_etlbot','adb',0,'2020-11-01 03:55:46','2020-11-01 03:55:46','2020-11-01 03:56:48','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-07''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:21:00',1603984287,220916,3,'marts_etlbot','adb',0,'2020-11-01 04:20:02','2020-11-01 04:20:02','2020-11-01 04:20:43','done',1,920,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 06:08:00',1603984287,226603,4,'tpnet_etlbot','adb',0,'2020-11-01 06:03:11','2020-11-01 06:03:11','2020-11-01 06:07:39','done',1,760,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:20:00',1603984287,227576,3,'marts_etlbot','adb',0,'2020-11-01 06:18:58','2020-11-01 06:18:58','2020-11-01 06:19:51','done',1,920,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 06:36:15',1603984287,228679,4,'nav_etlbot','adb',0,'2020-11-01 06:35:33','2020-11-01 06:35:33','2020-11-01 06:36:02','done',1,1940,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__unit_line'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__unit_line'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 06:40:15',1603984287,228827,4,'nav_etlbot','adb',0,'2020-11-01 06:38:00','2020-11-01 06:38:00','2020-11-01 06:39:58','done',1,2960,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_receipt_line'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_receipt_line'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 07:13:00',1603984287,235091,4,'payment_etlbot','adb',0,'2020-11-01 07:12:19','2020-11-01 07:12:19','2020-11-01 07:12:39','done',1,660,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:10:15',1603984287,216489,4,'tpnet_etlbot','adb',0,'2020-11-01 03:09:31','2020-11-01 03:09:31','2020-11-01 03:09:55','done',1,720,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00143_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00143_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:11:15',1603984287,216537,3,'marts_etlbot','adb',0,'2020-11-01 03:10:12','2020-11-01 03:10:12','2020-11-01 03:11:03','done',1,900,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:33:00',1603984287,217790,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 03:31:57','2020-11-01 03:32:41','done',0,68670,0.0,2.64,2.89,0,'','','','',''),
	 ('2020-11-01 03:45:15',1603984287,218592,4,'tpnet_etlbot','adb',0,'2020-11-01 03:44:38','2020-11-01 03:44:38','2020-11-01 03:45:08','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 109'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00109_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00109_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 109'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:46:45',1603984287,218695,4,'tpnet_etlbot','adb',0,'2020-11-01 03:46:08','2020-11-01 03:46:08','2020-11-01 03:46:38','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 51'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00051_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00051_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 51'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:46:45',1603984287,218474,4,'nav_etlbot','adb',0,'2020-11-01 03:42:41','2020-11-01 03:42:41','2020-11-01 03:46:29','done',1,7480,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_entry'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_entry'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:31:45',1603984287,217729,4,'tpnet_etlbot','adb',0,'2020-11-01 03:31:02','2020-11-01 03:31:02','2020-11-01 03:31:24','done',1,780,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 109'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00109_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00109_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 109'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:31:45',1603984287,217733,4,'tpnet_etlbot','adb',0,'2020-11-01 03:31:02','2020-11-01 03:31:02','2020-11-01 03:31:26','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00011_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00011_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:31:45',1603984287,217684,3,'dostovernost_etlbot','adb',0,'2020-11-01 03:30:07','2020-11-01 03:30:07','2020-11-01 03:31:24','done',1,810,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 03:40:45',1603984287,218289,3,'marts_etlbot','adb',0,'2020-11-01 03:39:41','2020-11-01 03:39:41','2020-11-01 03:40:34','done',1,8930,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-05''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:48:30',1603984287,218730,4,'tpnet_etlbot','adb',0,'2020-11-01 03:46:51','2020-11-01 03:46:51','2020-11-01 03:48:09','done',1,710,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:48:30',1603984287,218753,4,'tpnet_etlbot','adb',0,'2020-11-01 03:47:10','2020-11-01 03:47:10','2020-11-01 03:48:10','done',1,660,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:23:15',1603984287,213951,4,'tpnet_etlbot','adb',0,'2020-11-01 02:22:12','2020-11-01 02:22:12','2020-11-01 02:22:57','done',1,630,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 24'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00024_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00024_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 24'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:25:30',1603984287,214086,3,'marts_etlbot','adb',0,'2020-11-01 02:24:39','2020-11-01 02:24:39','2020-11-01 02:25:18','done',1,960,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-26''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:31:00',1603984287,214349,3,'marts_etlbot','adb',0,'2020-11-01 02:29:31','2020-11-01 02:29:31','2020-11-01 02:30:41','done',1,990,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:31:00',1603984287,214381,4,'tpnet_etlbot','adb',0,'2020-11-01 02:30:09','2020-11-01 02:30:09','2020-11-01 02:30:44','done',1,730,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00018_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00018_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:52:30',1603984287,215432,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:51:24','2020-11-01 02:52:10','done',0,274580,0.0,1.16,1.64,0,'','','','',''),
	 ('2020-11-01 03:04:30',1603984287,216062,3,'stockrepository_etlbot','adb',0,'2020-11-01 03:02:42','2020-11-01 03:02:42','2020-11-01 03:04:17','done',1,110,0.0,0.0,0.0,0,'
        select metadata.fn_p3_load_by_business_dt(''stockrepository_ods'',''full_stock_information'', ''20201031''::date,
                                                  array[''id_item'', ''id_location'', ''last_update_item'', ''stock_type'', ''qty'', ''last_update_stock_type''],
                                                  array[''int'', ''text'', ''timestamp'', ''text'', ''numeric(12,3)'', ''timestamp''],
        ''s3://d-dp-stock-repository/output/full_stock_information/20201031/'',''s3srv'');
    ','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:15:00',1603984287,216758,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 03:13:57','2020-11-01 03:14:53','done',0,353930,0.0,0.79,1.67,0,'','','','',''),
	 ('2020-11-01 03:29:45',1603984287,217606,4,'lynx_etlbot','adb',0,'2020-11-01 03:28:55','2020-11-01 03:28:55','2020-11-01 03:29:37','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''LYNX'' and stl.table_name = ''ap_int_dpac'';
                                    select metadata.fn_load_all_table(''lynx_raw'', 
                                                                      ''lynx_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''LYNX'' and stl.table_name = ''ap_int_dpac'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:39:45',1603984287,218247,4,'nav_etlbot','adb',0,'2020-11-01 03:38:59','2020-11-01 03:38:59','2020-11-01 03:39:27','done',1,1810,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__status_log'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__status_log'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213048,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:17','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 171'' and stl.table_name = ''txlm_cancartpickup'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00171_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00171_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 171'' and stl.table_name = ''txlm_cancartpickup'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213043,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:17','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''txlm_cancartpickup'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00017_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00017_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''txlm_cancartpickup'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:04:30',1603984287,213047,4,'tpnet_etlbot','adb',0,'2020-11-01 02:03:49','2020-11-01 02:03:49','2020-11-01 02:04:17','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 176'' and stl.table_name = ''txlm_bvlines'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00176_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00176_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 176'' and stl.table_name = ''txlm_bvlines'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:09:45',1603984287,213190,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 02:07:02','2020-11-01 02:07:02','2020-11-01 02:09:34','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:18:45',1603984287,206525,4,'nav_etlbot','adb',0,'2020-11-01 00:15:35','2020-11-01 00:15:35','2020-11-01 00:18:27','done',1,9230,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__unit'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__unit'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:24:30',1603984287,206847,4,'nav_etlbot','adb',0,'2020-11-01 00:20:39','2020-11-01 00:20:39','2020-11-01 00:24:15','done',1,7860,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_entry'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_entry'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:26:30',1603984287,207112,3,'marts_etlbot','adb',0,'2020-11-01 00:24:59','2020-11-01 00:24:59','2020-11-01 00:26:11','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-13''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:33:30',1603984287,207503,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 00:30:39','2020-11-01 00:33:15','done',0,11420,0.0,3.55,0.14,0,'','','','',''),
	 ('2020-11-01 01:01:15',1603984287,209542,3,'reviews_etlbot','adb',0,'2020-11-01 01:00:25','2020-11-01 01:00:25','2020-11-01 01:01:06','done',1,0,0.0,0.0,0.0,0,'select reviews_analysis_marts.sku_supplier();','','','Unknown','Unknown'),
	 ('2020-11-01 01:01:15',1603984287,209542,7,'reviews_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:00:26','2020-11-01 01:01:01','done',0,413090,0.0,0.03,0.03,0,'','','','',''),
	 ('2020-11-01 01:04:00',1603984287,209742,3,'marts_etlbot','adb',0,'2020-11-01 01:03:24','2020-11-01 01:03:24','2020-11-01 01:03:46','done',1,1050,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-18''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:08:45',1603984287,210022,3,'marts_etlbot','adb',0,'2020-11-01 01:07:45','2020-11-01 01:07:45','2020-11-01 01:08:38','done',1,1080,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:11:30',1603984287,209533,75,'findir_etlbot','adb',0,'2020-11-01 01:05:56','2020-11-01 01:05:56','2020-11-01 01:11:20','done',0,0,0.0,0.0,0.0,0,'select public.fn_analyze_table(''hyperion_ods'',''vd009_jour_ray_tgt''); select public.fn_analyze_table(''hyperion_ods'',''targets_store''); select public.fn_analyze_table(''hyperion_ods'',''targets_store_dept''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''sessions''); select public.fn_analyze_table(''rupturesmanagement_rupture_as01_ods'',''items''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_master''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''deps''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''groups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''class''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''subclass''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_date''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_item_lov''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''uda_values''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''store_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_mngrgn''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_cluster''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''district''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''currency_rates''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rpm_future_retail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''repl_item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''sups''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_supp_country''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordloc''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''ordhead''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_item_loc_comp_dpac''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_soh''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''inv_status_qty''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''code_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_detail''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''xxlm_rms_rtv_shipment''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''rtv_head_cfa_ext''); select public.fn_analyze_table(''rms_p009qtzb_rms_ods'',''item_loc_traits''); select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf009_vte_ligticcai_month'');select public.fn_analyze_table(''td_idwh1_bv_prod_009_pbsdbs_ods'',''tf040_vte_ligticcai'');','','','Unknown','Unknown'),
	 ('2020-11-01 01:39:30',1603984287,211788,4,'tpnet_etlbot','adb',0,'2020-11-01 01:37:08','2020-11-01 01:37:08','2020-11-01 01:39:10','done',1,670,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txlm_ftrextrec'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00006_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00006_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txlm_ftrextrec'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:05:15',1603984287,213011,4,'payment_etlbot','adb',0,'2020-11-01 02:03:05','2020-11-01 02:03:05','2020-11-01 02:04:59','done',1,630,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:09:30',1603984287,213164,4,'tpnet_etlbot','adb',0,'2020-11-01 02:06:27','2020-11-01 02:06:27','2020-11-01 02:09:13','done',1,690,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00036_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00036_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 36'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:11:00',1603984287,212898,4,'tpnet_etlbot','adb',0,'2020-11-01 02:00:36','2020-11-01 02:00:36','2020-11-01 02:10:45','done',1,800,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:11:00',1603984287,213095,3,'marts_etlbot','adb',0,'2020-11-01 02:04:55','2020-11-01 02:04:55','2020-11-01 02:10:41','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-24''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:30',1603984287,213586,4,'tpnet_etlbot','adb',0,'2020-11-01 02:14:49','2020-11-01 02:14:49','2020-11-01 02:15:15','done',1,680,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:30',1603984287,213585,4,'tpnet_etlbot','adb',0,'2020-11-01 02:14:49','2020-11-01 02:14:49','2020-11-01 02:15:12','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 31'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00031_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00031_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 31'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:30',1603984287,213592,4,'tpnet_etlbot','adb',0,'2020-11-01 02:14:51','2020-11-01 02:14:51','2020-11-01 02:15:15','done',1,700,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:15:30',1603984287,213572,3,'marts_etlbot','adb',0,'2020-11-01 02:14:27','2020-11-01 02:14:27','2020-11-01 02:15:17','done',1,20840,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-25''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:33:00',1603984287,214433,3,'marts_etlbot','adb',0,'2020-11-01 02:31:10','2020-11-01 02:31:10','2020-11-01 02:32:44','done',1,9320,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-27''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:03:15',1603984287,216034,4,'crm_etlbot','adb',0,'2020-11-01 03:02:12','2020-11-01 03:02:12','2020-11-01 03:02:56','done',1,1260,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_calltransferbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_calltransferbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:03:15',1603984287,216040,3,'marts_etlbot','adb',0,'2020-11-01 03:02:21','2020-11-01 03:02:21','2020-11-01 03:03:06','done',1,880,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:12:45',1603984287,216645,3,'marts_etlbot','adb',0,'2020-11-01 03:11:43','2020-11-01 03:11:43','2020-11-01 03:12:37','done',1,9700,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-02''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:24:45',1603984287,214062,4,'serviceplatform_etlbot','adb',0,'2020-11-01 02:24:09','2020-11-01 02:24:09','2020-11-01 02:24:30','done',1,530,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''ServicesPlatform'' and stl.table_name = ''servicebroker_service_task'';
                                    select metadata.fn_load_all_table(''serviceplatform_service_broker_all_raw'', 
                                                                      ''serviceplatform_service_broker_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''ServicesPlatform'' and stl.table_name = ''servicebroker_service_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:39:00',1603984287,214758,4,'tpnet_etlbot','adb',0,'2020-11-01 02:37:39','2020-11-01 02:37:39','2020-11-01 02:38:38','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00020_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00020_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:39:00',1603984287,214770,4,'tpnet_etlbot','adb',0,'2020-11-01 02:37:50','2020-11-01 02:37:50','2020-11-01 02:38:45','done',1,570,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00022_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00022_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:39:00',1603984287,214645,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:35:17','2020-11-01 02:38:52','done',0,206070,0.0,0.73,1.3,0,'','','','',''),
	 ('2020-11-01 02:41:30',1603984287,214914,4,'tpnet_etlbot','adb',0,'2020-11-01 02:40:45','2020-11-01 02:40:45','2020-11-01 02:41:09','done',1,630,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00018_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00018_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 18'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:04:45',1603984287,216132,3,'marts_etlbot','adb',0,'2020-11-01 03:03:47','2020-11-01 03:03:47','2020-11-01 03:04:36','done',1,9630,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-01''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:07:15',1603984287,213172,4,'tpnet_etlbot','adb',0,'2020-11-01 02:06:29','2020-11-01 02:06:29','2020-11-01 02:06:55','done',1,660,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_artpickup'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_artpickup'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:07:15',1603984287,213177,4,'payment_etlbot','adb',0,'2020-11-01 02:06:31','2020-11-01 02:06:31','2020-11-01 02:06:54','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickgateway_orderidtopaymenttype'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickgateway_orderidtopaymenttype'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:12:45',1603984287,213424,4,'payment_etlbot','adb',0,'2020-11-01 02:11:54','2020-11-01 02:11:54','2020-11-01 02:12:37','done',1,540,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:35:30',1603984287,214573,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:34:30','2020-11-01 02:35:20','done',0,593510,0.0,0.48,1.61,0,'','','','',''),
	 ('2020-11-01 02:36:15',1603984287,214573,3,'marts_etlbot','adb',0,'2020-11-01 02:34:07','2020-11-01 02:34:07','2020-11-01 02:35:54','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-27''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:39:30',1603984287,214785,3,'marts_etlbot','adb',0,'2020-11-01 02:38:12','2020-11-01 02:38:12','2020-11-01 02:39:11','done',1,900,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:12:30',1603984287,220337,4,'crm_etlbot','adb',0,'2020-11-01 04:11:14','2020-11-01 04:11:14','2020-11-01 04:12:16','done',1,1290,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_auditbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_auditbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:30:00',1603984287,221510,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 04:29:19','2020-11-01 04:29:50','done',0,478240,0.0,0.1,1.28,0,'','','','',''),
	 ('2020-11-01 04:40:30',1603984287,222091,3,'marts_etlbot','adb',0,'2020-11-01 04:39:28','2020-11-01 04:39:28','2020-11-01 04:40:23','done',1,1020,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:48:30',1603984287,222521,3,'marts_etlbot','adb',0,'2020-11-01 04:47:30','2020-11-01 04:47:30','2020-11-01 04:48:15','done',1,1000,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:38:30',1603984287,214763,4,'tpnet_etlbot','adb',0,'2020-11-01 02:37:41','2020-11-01 02:37:41','2020-11-01 02:38:10','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00022_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00022_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 22'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:38:30',1603984287,214762,4,'tpnet_etlbot','adb',0,'2020-11-01 02:37:41','2020-11-01 02:37:41','2020-11-01 02:38:10','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00020_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00020_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:43:45',1603984287,214942,3,'puz_etlbot','adb',0,'2020-11-01 02:41:14','2020-11-01 02:41:14','2020-11-01 02:43:30','done',1,280,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_invoice();','','','Unknown','Unknown'),
	 ('2020-11-01 02:50:15',1603984287,215320,3,'marts_etlbot','adb',0,'2020-11-01 02:48:37','2020-11-01 02:48:37','2020-11-01 02:49:59','done',1,19950,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-29''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:53:00',1603984287,215432,3,'marts_etlbot','adb',0,'2020-11-01 02:50:59','2020-11-01 02:50:59','2020-11-01 02:52:42','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-29''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:23:15',1603984287,217200,3,'marts_etlbot','adb',0,'2020-11-01 03:22:00','2020-11-01 03:22:00','2020-11-01 03:23:04','done',1,1160,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-10-03''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:26:30',1603984287,217390,4,'lynx_etlbot','adb',0,'2020-11-01 03:25:21','2020-11-01 03:25:21','2020-11-01 03:26:20','done',1,3600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''LYNX'' and stl.table_name = ''ap_workflow'';
                                    select metadata.fn_load_all_table(''lynx_raw'', 
                                                                      ''lynx_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''LYNX'' and stl.table_name = ''ap_workflow'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:28:45',1603984287,217551,3,'marts_etlbot','adb',0,'2020-11-01 03:27:48','2020-11-01 03:27:48','2020-11-01 03:28:37','done',1,1000,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:41:00',1603984287,213641,78,'findir_etlbot','adb',0,'2020-11-01 02:15:54','2020-11-01 02:15:54','2020-11-01 03:40:50','done',10,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 03:41:00',1603984287,213641,3,'findir_etlbot','adb',0,'2020-11-01 02:15:51','2020-11-01 02:15:51','2020-11-01 03:40:50','done',10,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 03:41:00',1603984287,213641,306,'findir_etlbot','adb',0,'2020-11-01 03:19:33','2020-11-01 03:19:33','2020-11-01 03:40:49','done',1,0,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 00:01:45',1603984287,205567,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 00:00:49','2020-11-01 00:00:49','2020-11-01 00:01:26','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:17:15',1603984287,206589,4,'tpnet_etlbot','adb',0,'2020-11-01 00:16:33','2020-11-01 00:16:33','2020-11-01 00:16:54','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 38'' and stl.table_name = ''txlm_ftrextrec'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00038_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00038_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 38'' and stl.table_name = ''txlm_ftrextrec'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:23:45',1603984287,206956,3,'marts_etlbot','adb',0,'2020-11-01 00:22:18','2020-11-01 00:22:18','2020-11-01 00:23:38','done',1,20560,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-13''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:23:45',1603984287,206955,3,'marts_etlbot','adb',0,'2020-11-01 00:22:17','2020-11-01 00:22:17','2020-11-01 00:23:29','done',1,9780,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-13''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:23:45',1603984287,206991,4,'tpnet_etlbot','adb',0,'2020-11-01 00:23:03','2020-11-01 00:23:03','2020-11-01 00:23:24','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txlm_efttransaction'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00011_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00011_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txlm_efttransaction'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:33:15',1603984287,207636,4,'lopus_etlbot','adb',0,'2020-11-01 00:32:35','2020-11-01 00:32:35','2020-11-01 00:32:57','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Lopus'' and stl.table_name = ''product'';
                                    select metadata.fn_load_all_table(''lopus_raw'', 
                                                                      ''lopus_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Lopus'' and stl.table_name = ''product'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:21:00',1603984287,220950,4,'crm_etlbot','adb',0,'2020-11-01 04:20:22','2020-11-01 04:20:22','2020-11-01 04:20:42','done',1,1360,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''connectionbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''connectionbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:28:30',1603984287,221396,3,'marts_etlbot','adb',0,'2020-11-01 04:27:25','2020-11-01 04:27:25','2020-11-01 04:28:08','done',1,22140,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:00:45',1603984287,223245,3,'da.gstock','adb',0,'2020-11-01 05:00:11','2020-11-01 05:00:11','2020-11-01 05:00:33','done',1,850,0.0,0.0,0.0,0,'select guaranteed_stock_mart.fn_calc_gs_datamarts();','','','Unknown','Unknown'),
	 ('2020-11-01 05:20:30',1603984287,224292,4,'cds_etlbot','adb',0,'2020-11-01 05:19:08','2020-11-01 05:19:08','2020-11-01 05:20:19','done',1,590,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:30:15',1603984287,224830,3,'marts_etlbot','adb',0,'2020-11-01 05:29:23','2020-11-01 05:29:23','2020-11-01 05:30:04','done',1,1080,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:55:15',1603984287,226138,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 05:54:34','2020-11-01 05:55:06','done',0,498600,0.0,0.08,1.57,0,'','','','',''),
	 ('2020-11-02 05:11:30',1603984287,310580,2,'zkp-mart-dev','adb',0,'2020-11-02 05:09:18','2020-11-02 05:09:18','2020-11-02 05:11:14','done',1,490,0.0,0.0,0.0,0,'SELECT sandbox_synoptique.update_rms();','','','Unknown','Unknown'),
	 ('2020-11-03 09:34:30',1603984287,404788,4,'grouper','adb',0,'2020-11-03 09:30:00','2020-11-03 09:30:00','2020-11-03 09:34:10','done',0,243060,0.0,0.0,0.0,0,'select schemaname,
               tablename,
               ad_group
        from t_relation_access_map
        where schemaname || ''.'' || tablename not in
              (
                  select distinct table_schema || ''.'' || table_name full_table_name
                  from information_schema.role_table_grants
                  where privilege_type = ''SELECT''
                    and grantee = ad_group
              )','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-03 09:34:30',1603984287,404789,3,'grouper','adb',0,'2020-11-03 09:30:00','2020-11-03 09:30:00','2020-11-03 09:34:10','done',9,90,0.0,0.0,0.0,0,'','','','',''),
	 ('2020-11-01 06:03:15',1603984287,226577,4,'tpnet_etlbot','adb',0,'2020-11-01 06:02:41','2020-11-01 06:02:41','2020-11-01 06:03:05','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 46'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00046_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00046_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 46'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 07:37:45',1603984287,236593,4,'cds_etlbot','adb',0,'2020-11-01 07:36:43','2020-11-01 07:36:43','2020-11-01 07:37:31','done',1,630,0.0,3.93,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 07:57:00',1603984287,237595,4,'tpnet_etlbot','adb',0,'2020-11-01 07:56:10','2020-11-01 07:56:10','2020-11-01 07:56:48','done',1,660,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 08:40:15',1603984287,239470,3,'puz_etlbot','adb',0,'2020-11-01 08:32:43','2020-11-01 08:32:43','2020-11-01 08:39:57','done',1,22680,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_order();','','','Unknown','Unknown'),
	 ('2020-11-01 09:38:00',1603984287,242781,4,'grouper','adb',0,'2020-11-01 09:33:56','2020-11-01 09:33:56','2020-11-01 09:37:48','done',0,226890,0.0,0.0,0.0,0,'select schemaname,
               tablename,
               ad_group
        from t_relation_access_map
        where schemaname || ''.'' || tablename not in
              (
                  select distinct table_schema || ''.'' || table_name full_table_name
                  from information_schema.role_table_grants
                  where privilege_type = ''SELECT''
                    and grantee = ad_group
              )','','','Unknown','Unknown'),
	 ('2020-11-01 09:38:00',1603984287,242781,2,'grouper','adb',0,'2020-11-01 09:30:00','2020-11-01 09:30:00','2020-11-01 09:37:48','done',1,0,0.0,0.0,0.0,0,'select public.fn_grant_tables_select()','','','Unknown','Unknown'),
	 ('2020-11-01 10:08:15',1603984287,245213,4,'payment_etlbot','adb',0,'2020-11-01 10:07:31','2020-11-01 10:07:31','2020-11-01 10:08:03','done',1,520,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 10:16:30',1603984287,245689,4,'payment_etlbot','adb',0,'2020-11-01 10:14:52','2020-11-01 10:14:52','2020-11-01 10:16:16','done',1,570,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktpnetinteraction_customerorder'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:46:45',1603984287,218683,4,'tpnet_etlbot','adb',0,'2020-11-01 03:45:57','2020-11-01 03:45:57','2020-11-01 03:46:30','done',1,650,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 65'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00065_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00065_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 65'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 03:46:45',1603984287,218682,4,'tpnet_etlbot','adb',0,'2020-11-01 03:45:57','2020-11-01 03:45:57','2020-11-01 03:46:37','done',1,0,0.0,1.78,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00006_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00006_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 6'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:06:00',1603984287,219945,45,'60089829','adb',0,'2020-11-01 04:05:29','2020-11-01 04:05:29','2020-11-01 04:05:52','done',924945,31480,0.0,0.16,0.01,0,'BEGIN;declare "SQL_CUR0x7f8fdc0010f0" cursor with hold for SELECT "v_tableau_main"."status_expired" AS "Calculation_208854474233077767",
  "v_tableau_main"."emp_with_stat_finish" AS "Calculation_208854474234937352",
  "v_tableau_main"."status_in_progress" AS "Calculation_515380723568427009",
  SUM(1) AS "sum:Number of Records:qk",
  SUM(1) AS "cnt:Migrated Data:qk",
  SUM("v_tableau_main"."all_course_stat") AS "sum:all_course_stat:qk",
  SUM("v_tableau_main"."all_employes") AS "sum:all_employes:qk",
  SUM("v_tableau_main"."average_score") AS "sum:average_score:qk",
  SUM("v_tableau_main"."course_delay") AS "sum:course_delay:qk",
  "v_tableau_main"."course_destination" AS "course_destination",
  SUM("v_tableau_main"."course_duration") AS "sum:course_duration:qk",
  "v_tableau_main"."course_finish_date" AS "course_finish_date",
  "v_tableau_main"."course_int_ext" AS "course_int_ext",
  "v_tableau_main"."course_name" AS "course_name",
  SUM("v_tableau_main"."course_price") AS "sum:course_price:qk",
  "v_tableau_main"."course_status" AS "course_status",
  "v_tableau_main"."course_type" AS "course_type",
  SUM("v_tableau_main"."emp_with_stat_finish") AS "sum:emp_with_stat_finish:qk",
  "v_tableau_main"."emp_with_stat_testing_passed" AS "emp_with_stat_testing_passed",
  SUM("v_tableau_main"."price_1_hour") AS "sum:price_1_hour:qk",
  CAST("v_tableau_main"."program_name" AS TEXT) AS "program_name",
  "v_tableau_main"."section_finish_date" AS "section_finish_date",
  "v_tableau_main"."section_start_date" AS "section_start_date",
  "v_tableau_main"."status_expired" AS "status_expired",
  "v_tableau_main"."status_in_progress" AS "status_in_progress",
  "v_tableau_main"."student_department" AS "student_department",
  "v_tableau_main"."student_division" AS "student_division",
  "v_tableau_main"."student_id" AS "student_id",
  "v_tableau_main"."student_job_code" AS "student_job_code",
  "v_tableau_main"."student_region" AS "student_region",
  "v_tableau_main"."student_sector" AS "student_sector",
  SUM("v_tableau_main"."training") AS "sum:training:qk"
FROM "success_factor_marts"."v_tableau_main" "v_tableau_main"
GROUP BY 2,
  10,
  12,
  13,
  14,
  16,
  17,
  19,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31;fetch 2048 in "SQL_CUR0x7f8fdc0010f0"','','','Unknown','Unknown'),
	 ('2020-11-01 04:06:00',1603984287,219947,4,'tpnet_etlbot','adb',0,'2020-11-01 04:05:23','2020-11-01 04:05:23','2020-11-01 04:05:47','done',1,650,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:41:45',1603984287,222174,3,'marts_etlbot','adb',0,'2020-11-01 04:40:55','2020-11-01 04:40:55','2020-11-01 04:41:30','done',1,8640,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-14''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:00:30',1603984287,219578,4,'crm_etlbot','adb',0,'2020-11-01 03:59:38','2020-11-01 03:59:38','2020-11-01 04:00:19','done',1,1490,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''quotebase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''quotebase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-02 12:03:45',1603984287,251367,170,'naucrm_ingestbot','adb',0,'2020-11-02 12:03:07','2020-11-02 12:03:07','2020-11-02 12:03:30','done',0,14090,0.0,4.85,0.0,0,'INSERT INTO naucrm_ods.kpi(created_at, report_name, report_caption, interval_start, interval_end, filters, att, period, cnt_service, sl_80_60, cnt_all_calls, aht, utl, cnt_queue, sl_80_30, asa, occ, cnt_call_back, cnt_outgoing, fcr, cnt_lost_less_5, cnt_no_ivr, cnt_finish_ivr, phone_number, cnt_lost, cnt_lost_more_5, lost_per) VALUES(''1604307758'', ''KPI'', ''Отчет по KPI'', ''01.10.2020 00:00:00'', ''23.10.2020 00:00:00'', ''"Уровень группировки"=>"Суммарно за весь период","Очередь"=>"Leroy Merlin_Выделенный подбор"'', null, ''01.10.2020 00:00:00 - 23.10.2020 00:00:00'', ''0'', ''0'', ''0'', null, null, ''0'', ''0'', null, null, ''0'', ''0'', ''0.00'', ''0'', ''0'', ''0'', ''Все'', ''0'', ''0'', ''0'')','','PostgreSQL JDBC Driver','Unknown','Unknown'),
	 ('2020-11-01 04:06:30',1603984287,219958,4,'tpnet_etlbot','adb',0,'2020-11-01 04:05:33','2020-11-01 04:05:33','2020-11-01 04:06:17','done',1,670,0.0,2.11,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:15:30',1603984287,220542,3,'marts_etlbot','adb',0,'2020-11-01 04:14:32','2020-11-01 04:14:32','2020-11-01 04:15:20','done',1,22980,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-10''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:49:45',1603984287,222601,3,'marts_etlbot','adb',0,'2020-11-01 04:48:52','2020-11-01 04:48:52','2020-11-01 04:49:38','done',1,23270,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-15''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:04:00',1603984287,223378,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 05:02:51','2020-11-01 05:03:52','done',0,145250,0.0,1.73,2.45,0,'','','','','');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 05:08:15',1603984287,223634,4,'payment_etlbot','adb',0,'2020-11-01 05:07:32','2020-11-01 05:07:32','2020-11-01 05:08:02','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricksberbank_order'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:45:45',1603984287,218632,4,'tpnet_etlbot','adb',0,'2020-11-01 03:45:17','2020-11-01 03:45:17','2020-11-01 03:45:38','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 80'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00080_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00080_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 80'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:54:45',1603984287,219188,3,'marts_etlbot','adb',0,'2020-11-01 03:53:57','2020-11-01 03:53:57','2020-11-01 03:54:27','done',1,9650,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-07''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:04:30',1603984287,219836,4,'gold_refgwr_etlbot','adb',0,'2020-11-01 04:03:48','2020-11-01 04:03:48','2020-11-01 04:04:13','done',1,10610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Gold_refgwr'' and stl.table_name = ''fctentpvh'';
                                    select metadata.fn_load_all_table(''gold_refgwr_raw'', 
                                                                      ''gold_refgwr_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Gold_refgwr'' and stl.table_name = ''fctentpvh'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:04:45',1603984287,219831,2,'zkp-mart-dev','adb',0,'2020-11-01 04:03:41','2020-11-01 04:03:41','2020-11-01 04:04:35','done',1,300,0.0,0.0,0.0,0,'SELECT sandbox_synoptique.calc_avg_resell(2);','','','Unknown','Unknown'),
	 ('2020-11-01 04:09:00',1603984287,220103,3,'marts_etlbot','adb',0,'2020-11-01 04:07:48','2020-11-01 04:07:48','2020-11-01 04:08:40','done',1,23120,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-09''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:24:30',1603984287,221109,3,'marts_etlbot','adb',0,'2020-11-01 04:23:00','2020-11-01 04:23:00','2020-11-01 04:24:11','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-11''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:30:30',1603984287,221510,3,'marts_etlbot','adb',0,'2020-11-01 04:29:16','2020-11-01 04:29:16','2020-11-01 04:30:21','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:38:45',1603984287,221998,3,'puz_etlbot','adb',0,'2020-11-01 04:37:57','2020-11-01 04:37:57','2020-11-01 04:38:24','done',1,50,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_invoice();','','','Unknown','Unknown'),
	 ('2020-11-01 04:41:15',1603984287,222149,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 04:40:23','2020-11-01 04:40:23','2020-11-01 04:40:54','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 05:19:45',1603984287,224285,3,'marts_etlbot','adb',0,'2020-11-01 05:18:56','2020-11-01 05:18:56','2020-11-01 05:19:28','done',1,9290,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-19''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:22:00',1603984287,224366,3,'marts_etlbot','adb',0,'2020-11-01 05:20:40','2020-11-01 05:20:40','2020-11-01 05:21:49','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-19''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:33:45',1603984287,224978,3,'marts_etlbot','adb',0,'2020-11-01 05:32:25','2020-11-01 05:32:25','2020-11-01 05:33:32','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-21''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:47:15',1603984287,225705,3,'marts_etlbot','adb',0,'2020-11-01 05:46:21','2020-11-01 05:46:21','2020-11-01 05:47:06','done',1,1020,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:58:15',1603984287,226297,3,'marts_etlbot','adb',0,'2020-11-01 05:57:16','2020-11-01 05:57:16','2020-11-01 05:57:56','done',1,910,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:02:45',1603984287,205669,4,'crm_etlbot','adb',0,'2020-11-01 00:02:10','2020-11-01 00:02:10','2020-11-01 00:02:30','done',1,1290,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_calltransferbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''lmr_calltransferbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:20:30',1603984287,206770,4,'nav_etlbot','adb',0,'2020-11-01 00:19:30','2020-11-01 00:19:30','2020-11-01 00:20:16','done',1,2680,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_receipt_line'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_receipt_line'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:22:00',1603984287,206873,3,'marts_etlbot','adb',0,'2020-11-01 00:21:04','2020-11-01 00:21:04','2020-11-01 00:21:48','done',1,1010,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:48:45',1603984287,208658,3,'marts_etlbot','adb',0,'2020-11-01 00:47:23','2020-11-01 00:47:23','2020-11-01 00:48:32','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-16''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:21:30',1603984287,210413,8,'findir_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:20:15','2020-11-01 01:21:16','done',0,2231090,0.0,0.03,0.03,0,'','','','','');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:21:30',1603984287,210908,4,'quotation_etlbot','adb',0,'2020-11-01 01:20:37','2020-11-01 01:20:37','2020-11-01 01:21:15','done',1,2100,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'';
                                    select metadata.fn_load_all_table(''quotation_quotation_all_raw'', 
                                                                      ''quotation_quotation_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:21:30',1603984287,210829,4,'payment_etlbot','adb',0,'2020-11-01 01:19:15','2020-11-01 01:19:15','2020-11-01 01:21:14','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:21:30',1603984287,210755,3,'marts_etlbot','adb',0,'2020-11-01 01:18:25','2020-11-01 01:18:25','2020-11-01 01:21:16','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-20''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:13:30',1603984287,213166,4,'tpnet_etlbot','adb',0,'2020-11-01 02:06:28','2020-11-01 02:06:28','2020-11-01 02:13:12','done',1,840,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:16:30',1603984287,213636,49,'findir_etlbot','adb',0,'2020-11-01 02:15:48','2020-11-01 02:15:48','2020-11-01 02:16:18','done',1,0,0.0,0.0,0.0,0,'(select *
from findir_dq.fn_dq_run_case(case_num._case_id))','','','Unknown','Unknown'),
	 ('2020-11-01 02:16:30',1603984287,213636,3,'findir_etlbot','adb',0,'2020-11-01 02:15:47','2020-11-01 02:15:47','2020-11-01 02:16:18','done',1,0,0.0,0.0,0.0,0,'SELECT findir_dq.fn_dq_build_cases_and_run_chain(''tpnet'',''2020-10-29''::date,35,110::text);','','','Unknown','Unknown'),
	 ('2020-11-01 02:16:30',1603984287,213636,48,'findir_etlbot','adb',0,'2020-11-01 02:15:48','2020-11-01 02:15:48','2020-11-01 02:16:18','done',8,0,0.0,0.0,2.0,0,'select * from tmp_dq_chain_run order by chain_order','','','Unknown','Unknown'),
	 ('2020-11-01 02:18:00',1603984287,213686,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:16:47','2020-11-01 02:17:45','done',0,245420,0.0,1.27,0.74,0,'','','','',''),
	 ('2020-11-01 02:18:30',1603984287,213686,3,'marts_etlbot','adb',0,'2020-11-01 02:16:29','2020-11-01 02:16:29','2020-11-01 02:18:20','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-25''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:18:30',1603984287,213688,4,'tpnet_etlbot','adb',0,'2020-11-01 02:16:29','2020-11-01 02:16:29','2020-11-01 02:18:08','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:21:30',1603984287,213720,4,'cds_etlbot','adb',0,'2020-11-01 02:17:08','2020-11-01 02:17:08','2020-11-01 02:21:21','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:21:30',1603984287,213864,4,'tpnet_etlbot','adb',0,'2020-11-01 02:20:21','2020-11-01 02:20:21','2020-11-01 02:21:21','done',1,700,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 24'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00024_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00024_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 24'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:26:15',1603984287,214126,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 02:25:27','2020-11-01 02:26:05','done',0,723880,0.0,0.07,1.08,0,'','','','',''),
	 ('2020-11-01 00:06:30',1603984287,205845,4,'crm_etlbot','adb',0,'2020-11-01 00:05:09','2020-11-01 00:05:09','2020-11-01 00:06:11','done',1,1500,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''phonecallbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''phonecallbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:06:30',1603984287,205897,3,'marts_etlbot','adb',0,'2020-11-01 00:06:01','2020-11-01 00:06:01','2020-11-01 00:06:22','done',1,1100,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_conquest(''2020-09-11''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 00:34:15',1603984287,207652,3,'marts_etlbot','adb',0,'2020-11-01 00:32:41','2020-11-01 00:32:41','2020-11-01 00:34:04','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-09-14''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:15',1603984287,209574,3,'marts_etlbot','adb',0,'2020-11-01 01:00:48','2020-11-01 01:00:48','2020-11-01 01:02:00','done',1,9620,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-18''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:30',1603984287,209626,4,'crm_etlbot','adb',0,'2020-11-01 01:01:39','2020-11-01 01:01:39','2020-11-01 01:02:20','done',1,1590,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''accountbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''accountbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:30',1603984287,209577,3,'marts_etlbot','adb',0,'2020-11-01 01:00:48','2020-11-01 01:00:48','2020-11-01 01:02:20','done',1,21630,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-18''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:02:30',1603984287,209646,3,'crm_etlbot','adb',0,'2020-11-01 01:01:55','2020-11-01 01:01:55','2020-11-01 01:02:23','done',1,1000,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_incidents_detail_delta();','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:10:00',1603984287,210123,3,'marts_etlbot','adb',0,'2020-11-01 01:09:07','2020-11-01 01:09:07','2020-11-01 01:09:42','done',1,9970,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-19''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:10:00',1603984287,210124,3,'marts_etlbot','adb',0,'2020-11-01 01:09:07','2020-11-01 01:09:07','2020-11-01 01:09:50','done',1,23080,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-19''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:17:30',1603984287,210606,3,'marts_etlbot','adb',0,'2020-11-01 01:16:03','2020-11-01 01:16:03','2020-11-01 01:17:12','done',1,23030,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-20''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:20:00',1603984287,210755,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:18:46','2020-11-01 01:19:46','done',0,298570,0.0,1.15,2.79,0,'','','','',''),
	 ('2020-11-01 01:20:00',1603984287,210390,12,'findir_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:19:22','2020-11-01 01:19:49','done',0,3954110,0.0,0.05,0.05,0,'','','','',''),
	 ('2020-11-01 01:24:30',1603984287,211087,4,'tpnet_etlbot','adb',0,'2020-11-01 01:23:55','2020-11-01 01:23:55','2020-11-01 01:24:21','done',1,610,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txmedialine'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txmedialine'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:16:00',1603984287,210507,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 01:14:32','2020-11-01 01:14:32','2020-11-01 01:15:48','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:20:45',1603984287,210832,4,'cart_etlbot','adb',0,'2020-11-01 01:19:16','2020-11-01 01:19:16','2020-11-01 01:20:27','done',1,3420,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Cart'' and stl.table_name = ''checkoutv2cart_cart'';
                                    select metadata.fn_load_all_table(''cart_cart_all_raw'', 
                                                                      ''cart_cart_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Cart'' and stl.table_name = ''checkoutv2cart_cart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:23:00',1603984287,210963,4,'deliveryrepository_etlbot','adb',0,'2020-11-01 01:21:34','2020-11-01 01:21:34','2020-11-01 01:22:44','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''deliveryrepository_deliveryoffline_public_raw'', 
                                                                      ''deliveryrepository_deliveryoffline_public_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''DeliveryRepository'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:43:00',1603984287,212053,4,'tpnet_etlbot','adb',0,'2020-11-01 01:42:25','2020-11-01 01:42:25','2020-11-01 01:42:45','done',1,610,0.0,1.76,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txdiscinfo'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txdiscinfo'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 02:13:45',1603984287,213482,4,'payment_etlbot','adb',0,'2020-11-01 02:12:57','2020-11-01 02:12:57','2020-11-01 02:13:36','done',1,580,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolgiveawayorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:28:00',1603984287,214094,4,'cds_etlbot','adb',0,'2020-11-01 02:24:47','2020-11-01 02:24:47','2020-11-01 02:27:49','done',1,710,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:41:15',1603984287,214917,4,'tpnet_etlbot','adb',0,'2020-11-01 02:40:45','2020-11-01 02:40:45','2020-11-01 02:41:08','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00017_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00017_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 17'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 02:41:15',1603984287,214414,3,'puz_etlbot','adb',0,'2020-11-01 02:30:50','2020-11-01 02:30:50','2020-11-01 02:41:08','done',1,2530,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_order_product();','','','Unknown','Unknown'),
	 ('2020-11-01 02:41:15',1603984287,214864,3,'marts_etlbot','adb',0,'2020-11-01 02:39:41','2020-11-01 02:39:41','2020-11-01 02:40:58','done',1,19470,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-28''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 02:41:15',1603984287,214912,4,'tpnet_etlbot','adb',0,'2020-11-01 02:40:45','2020-11-01 02:40:45','2020-11-01 02:41:06','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00023_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00023_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:48:00',1603984287,218762,3,'marts_etlbot','adb',0,'2020-11-01 03:47:16','2020-11-01 03:47:16','2020-11-01 03:47:50','done',1,8550,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-06''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:48:00',1603984287,218770,4,'tpnet_etlbot','adb',0,'2020-11-01 03:47:28','2020-11-01 03:47:28','2020-11-01 03:47:49','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00020_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00020_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 20'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:50:00',1603984287,218882,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 03:49:19','2020-11-01 03:49:50','done',0,475020,0.0,0.09,1.18,0,'','','','',''),
	 ('2020-11-01 04:03:00',1603984287,219664,4,'gold_refgwr_etlbot','adb',0,'2020-11-01 04:00:58','2020-11-01 04:00:58','2020-11-01 04:02:39','done',1,18920,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Gold_refgwr'' and stl.table_name = ''prpsavprop'';
                                    select metadata.fn_load_all_table(''gold_refgwr_raw'', 
                                                                      ''gold_refgwr_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Gold_refgwr'' and stl.table_name = ''prpsavprop'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 04:22:00',1603984287,221000,3,'marts_etlbot','adb',0,'2020-11-01 04:21:09','2020-11-01 04:21:09','2020-11-01 04:21:41','done',1,9290,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-11''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:35:45',1603984287,221659,4,'payment_etlbot','adb',0,'2020-11-01 04:32:04','2020-11-01 04:32:04','2020-11-01 04:35:29','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:31:45',1603984287,224869,3,'dostovernost_etlbot','adb',0,'2020-11-01 05:30:05','2020-11-01 05:30:05','2020-11-01 05:31:24','done',1,720,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 05:33:00',1603984287,224848,4,'cds_etlbot','adb',0,'2020-11-01 05:29:43','2020-11-01 05:29:43','2020-11-01 05:32:40','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:37:00',1603984287,225187,3,'marts_etlbot','adb',0,'2020-11-01 05:36:19','2020-11-01 05:36:19','2020-11-01 05:36:48','done',1,8750,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-22''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:09:30',1603984287,216381,1,'t-greenplum-svc','adb',0,'2020-11-01 03:07:45','2020-11-01 03:07:45','2020-11-01 03:09:20','done',8298859,444830,0.0,2.37,0.19,0,'select
	cast(ilt.item as text) as product_code,
	substring(ilt.in_store_market_basket from 4) as top,
	cast(ilt.loc as text) as store_id
from
	rms_p009qtzb_rms_ods.v_ITEM_LOC_TRAITS ilt
	left join rms_p009qtzb_rms_ods.v_item_loc_soh ils on ilt.item = ils.item and ilt.loc = ils.loc and ils.loc_type = ''S'' and ils.is_actual = ''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty c3 on c3.item = ils.item and c3.location = ils.loc and c3.inv_status = 6 and c3.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty whb on whb.item = ils.item and whb.location = ils.loc and whb.inv_status = 8 and whb.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty whbp on whbp.item = ils.item and whbp.location = ils.loc and whbp.inv_status = 9 and whbp.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty tbc on tbc.item = ils.item and tbc.location = ils.loc and tbc.inv_status = 10 and tbc.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty uts on uts.item = ils.item and uts.location = ils.loc and uts.inv_status = 2 and uts.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty utsp on utsp.item = ils.item and utsp.location = ils.loc and utsp.inv_status = 11 and utsp.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_inv_status_qty cor on cor.item = ils.item and cor.location = ils.loc and cor.inv_status = 1 and cor.is_actual=''1''
	left join rms_p009qtzb_rms_ods.v_repl_item_loc ril on ril.item = ils.item and ril.location = ils.loc and ril.is_actual=''1''
	inner join rms_p009qtzb_rms_ods.v_item_master im on im.item = ilt.item and im.is_actual = ''1''
where
	ilt.is_actual = ''1'' 
	and (
		ils.stock_on_hand <> 0 or
		coalesce(ril.demo_stock, 0) <> 0 or
		coalesce(c3.qty, 0) <> 0 or
		coalesce(ils.rtv_qty, 0) <> 0 or 
		coalesce(ils.tsf_reserved_qty, 0) <> 0 or
		coalesce(whb.qty, 0) <> 0 or 
		coalesce(whbp.qty, 0) <> 0 or
		coalesce(tbc.qty, 0) <> 0 or 
		coalesce(uts.qty, 0) <> 0 or
		coalesce(utsp.qty, 0) <> 0 or
		coalesce(cor.qty, 0) <> 0 or
		ilt.in_store_market_basket <> ''TOP0''
	)
	and ilt.in_store_market_basket is not null;','','','Unknown','Unknown'),
	 ('2020-11-01 03:09:30',1603984287,216422,4,'crm_etlbot','adb',0,'2020-11-01 03:08:35','2020-11-01 03:08:35','2020-11-01 03:09:18','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:43:30',1603984287,218406,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 03:41:48','2020-11-01 03:43:20','done',0,41520,0.0,3.82,3.87,0,'','','','',''),
	 ('2020-11-01 03:56:30',1603984287,219312,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 03:55:48','2020-11-01 03:56:18','done',0,468340,0.0,0.08,1.37,0,'','','','',''),
	 ('2020-11-01 04:02:45',1603984287,219708,3,'crm_etlbot','adb',0,'2020-11-01 04:01:48','2020-11-01 04:01:48','2020-11-01 04:02:32','done',1,470,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_detail_call_transfers_delta();','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 04:31:30',1603984287,221561,3,'dostovernost_etlbot','adb',0,'2020-11-01 04:30:14','2020-11-01 04:30:14','2020-11-01 04:31:23','done',1,790,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 04:35:15',1603984287,221767,3,'marts_etlbot','adb',0,'2020-11-01 04:34:07','2020-11-01 04:34:07','2020-11-01 04:34:59','done',1,21600,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-13''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:36:30',1603984287,221883,4,'payment_etlbot','adb',0,'2020-11-01 04:35:56','2020-11-01 04:35:56','2020-11-01 04:36:19','done',1,630,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbrickatol_atolsaleorderdocument'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:36:45',1603984287,221737,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 04:33:19','2020-11-01 04:36:26','done',0,198360,0.0,0.65,3.9,0,'','','','',''),
	 ('2020-11-01 04:42:00',1603984287,222173,3,'marts_etlbot','adb',0,'2020-11-01 04:40:55','2020-11-01 04:40:55','2020-11-01 04:41:44','done',1,22010,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-14''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:42:00',1603984287,221737,3,'puz_etlbot','adb',0,'2020-11-01 04:33:19','2020-11-01 04:33:19','2020-11-01 04:41:44','done',1,12720,0.0,0.0,0.0,0,'select puz_ods.from_raw_to_ods_order();','','','Unknown','Unknown'),
	 ('2020-11-01 05:00:30',1603984287,223216,3,'marts_etlbot','adb',0,'2020-11-01 04:59:29','2020-11-01 04:59:29','2020-11-01 05:00:19','done',1,970,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:01:30',1603984287,223284,3,'marts_etlbot','adb',0,'2020-11-01 05:00:43','2020-11-01 05:00:43','2020-11-01 05:01:18','done',1,8860,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-17''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:01:30',1603984287,223246,2,'zkp-mart-dev','adb',0,'2020-11-01 05:00:11','2020-11-01 05:00:11','2020-11-01 05:01:10','done',1,5360,0.0,0.0,0.0,0,'SELECT sandbox_synoptique.gen_lopus();','','','Unknown','Unknown'),
	 ('2020-11-01 05:52:30',1603984287,226000,3,'marts_etlbot','adb',0,'2020-11-01 05:51:40','2020-11-01 05:51:40','2020-11-01 05:52:21','done',1,1040,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 05:55:45',1603984287,226138,3,'marts_etlbot','adb',0,'2020-11-01 05:54:33','2020-11-01 05:54:33','2020-11-01 05:55:37','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-25''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:59:15',1603984287,226341,3,'marts_etlbot','adb',0,'2020-11-01 05:58:19','2020-11-01 05:58:19','2020-11-01 05:59:01','done',1,21390,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-26''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 07:13:45',1603984287,235002,4,'payment_etlbot','adb',0,'2020-11-01 07:11:12','2020-11-01 07:11:12','2020-11-01 07:13:28','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 07:30:00',1603984287,236081,4,'payment_etlbot','adb',0,'2020-11-01 07:27:36','2020-11-01 07:27:36','2020-11-01 07:29:47','done',1,610,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'';
                                    select metadata.fn_load_all_table(''payment_all_all_raw'', 
                                                                      ''payment_all_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Payment'' and stl.table_name = ''paymentbricktasks_task'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 07:40:45',1603984287,236737,4,'cds_etlbot','adb',0,'2020-11-01 07:39:14','2020-11-01 07:39:14','2020-11-01 07:40:30','done',1,600,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:41:00',1603984287,218326,4,'tpnet_etlbot','adb',0,'2020-11-01 03:40:24','2020-11-01 03:40:24','2020-11-01 03:40:53','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txtotal'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txtotal'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:41:00',1603984287,218325,4,'tpnet_etlbot','adb',0,'2020-11-01 03:40:24','2020-11-01 03:40:24','2020-11-01 03:40:49','done',1,0,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txtotal'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txtotal'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:44:00',1603984287,218512,4,'nav_etlbot','adb',0,'2020-11-01 03:43:24','2020-11-01 03:43:24','2020-11-01 03:43:51','done',1,1690,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_activity_line'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''warehouse_activity_line'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:44:15',1603984287,218406,3,'marts_etlbot','adb',0,'2020-11-01 03:41:41','2020-11-01 03:41:41','2020-11-01 03:43:54','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-05''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:47:45',1603984287,218749,4,'tpnet_etlbot','adb',0,'2020-11-01 03:47:05','2020-11-01 03:47:05','2020-11-01 03:47:27','done',1,570,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 00:33:15',1603984287,207647,4,'tpnet_etlbot','adb',0,'2020-11-01 00:32:38','2020-11-01 00:32:38','2020-11-01 00:32:59','done',1,660,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00011_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00011_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 11'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 00:38:45',1603984287,207994,3,'marts_etlbot','adb',0,'2020-11-01 00:38:00','2020-11-01 00:38:00','2020-11-01 00:38:35','done',1,9700,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-09-15''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:05:45',1603984287,209788,4,'cds_etlbot','adb',0,'2020-11-01 01:04:13','2020-11-01 01:04:13','2020-11-01 01:05:24','done',1,790,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:25:00',1603984287,211110,4,'tpnet_etlbot','adb',0,'2020-11-01 01:24:19','2020-11-01 01:24:19','2020-11-01 01:24:47','done',1,590,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00003_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00003_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 3'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:45:30',1603984287,211703,4,'cds_etlbot','adb',0,'2020-11-01 01:35:15','2020-11-01 01:35:15','2020-11-01 01:45:18','done',1,800,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:05:15',1603984287,226677,4,'tpnet_etlbot','adb',0,'2020-11-01 06:04:28','2020-11-01 06:04:28','2020-11-01 06:05:04','done',1,650,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 33'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00033_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00033_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 33'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:06:30',1603984287,226676,4,'tpnet_etlbot','adb',0,'2020-11-01 06:04:28','2020-11-01 06:04:28','2020-11-01 06:06:14','done',1,730,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:07:15',1603984287,226793,4,'tpnet_etlbot','adb',0,'2020-11-01 06:06:33','2020-11-01 06:06:33','2020-11-01 06:07:02','done',1,690,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_ftrextrec'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_ftrextrec'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:07:15',1603984287,226610,4,'tpnet_etlbot','adb',0,'2020-11-01 06:03:13','2020-11-01 06:03:13','2020-11-01 06:07:02','done',1,670,0.0,1.76,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 10:16:30',1603984287,245556,4,'cds_etlbot','adb',0,'2020-11-01 10:12:35','2020-11-01 10:12:35','2020-11-01 10:16:11','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 10:30:45',1603984287,246591,4,'puz_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 10:30:09','2020-11-01 10:30:36','done',0,14120,0.0,0.05,0.07,0,'','','','',''),
	 ('2020-11-01 11:06:30',1603984287,248399,4,'quotation_etlbot','adb',0,'2020-11-01 11:05:32','2020-11-01 11:05:32','2020-11-01 11:06:13','done',1,1970,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'';
                                    select metadata.fn_load_all_table(''quotation_quotation_all_raw'', 
                                                                      ''quotation_quotation_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 11:17:15',1603984287,248910,4,'tpnet_etlbot','adb',0,'2020-11-01 11:14:53','2020-11-01 11:14:53','2020-11-01 11:17:06','done',1,780,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 11:17:15',1603984287,248849,4,'cds_etlbot','adb',0,'2020-11-01 11:13:47','2020-11-01 11:13:47','2020-11-01 11:17:06','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:42:45',1603984287,222219,4,'quotation_etlbot','adb',0,'2020-11-01 04:41:54','2020-11-01 04:41:54','2020-11-01 04:42:25','done',1,1900,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'';
                                    select metadata.fn_load_all_table(''quotation_quotation_all_raw'', 
                                                                      ''quotation_quotation_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Quotation'' and stl.table_name = ''checkoutv2quotation_quotation'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:45:15',1603984287,222196,4,'cds_etlbot','adb',0,'2020-11-01 04:41:23','2020-11-01 04:41:23','2020-11-01 04:44:56','abort',0,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 04:58:00',1603984287,223057,3,'marts_etlbot','adb',0,'2020-11-01 04:56:42','2020-11-01 04:56:42','2020-11-01 04:57:46','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-16''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:01:00',1603984287,223172,4,'cds_etlbot','adb',0,'2020-11-01 04:58:40','2020-11-01 04:58:40','2020-11-01 05:00:40','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''delivery_item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:05:30',1603984287,223506,4,'tpnet_etlbot','adb',0,'2020-11-01 05:04:57','2020-11-01 05:04:57','2020-11-01 05:05:19','done',1,640,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00023_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00023_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 23'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 05:25:30',1603984287,224569,4,'cart_etlbot','adb',0,'2020-11-01 05:24:36','2020-11-01 05:24:36','2020-11-01 05:25:22','done',1,3360,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''Cart'' and stl.table_name = ''checkoutv2cart_cart'';
                                    select metadata.fn_load_all_table(''cart_cart_all_raw'', 
                                                                      ''cart_cart_all_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''Cart'' and stl.table_name = ''checkoutv2cart_cart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 06:00:45',1603984287,226424,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 05:59:57','2020-11-01 06:00:36','done',0,564560,0.0,0.09,0.75,0,'','','','',''),
	 ('2020-11-01 06:05:45',1603984287,226665,4,'crm_etlbot','adb',0,'2020-11-01 06:04:10','2020-11-01 06:04:10','2020-11-01 06:05:27','done',1,1420,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postregardingbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postregardingbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:05:45',1603984287,226690,3,'marts_etlbot','adb',0,'2020-11-01 06:04:39','2020-11-01 06:04:39','2020-11-01 06:05:36','done',1,9950,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-27''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 06:05:45',1603984287,226697,4,'tpnet_etlbot','adb',0,'2020-11-01 06:04:49','2020-11-01 06:04:49','2020-11-01 06:05:34','done',1,650,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 31'' and stl.table_name = ''txtaxart'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00031_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00031_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 31'' and stl.table_name = ''txtaxart'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:26:15',1603984287,228001,3,'marts_etlbot','adb',0,'2020-11-01 06:25:14','2020-11-01 06:25:14','2020-11-01 06:25:57','done',1,880,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 06:27:15',1603984287,228080,3,'marts_etlbot','adb',0,'2020-11-01 06:26:24','2020-11-01 06:26:24','2020-11-01 06:26:57','done',1,9440,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-30''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 06:27:30',1603984287,228092,3,'marts_etlbot','adb',0,'2020-11-01 06:26:30','2020-11-01 06:26:30','2020-11-01 06:27:13','done',1,21240,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-10-30''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 06:31:45',1603984287,228340,3,'dostovernost_etlbot','adb',0,'2020-11-01 06:30:14','2020-11-01 06:30:14','2020-11-01 06:31:27','done',1,820,0.0,0.0,0.0,0,'select dostovernost_marts.fn_update_dostovernost_dynamic();','','','Unknown','Unknown'),
	 ('2020-11-01 06:38:30',1603984287,228640,3,'marts_etlbot','adb',0,'2020-11-01 06:34:53','2020-11-01 06:34:53','2020-11-01 06:38:10','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 07:01:15',1603984287,234313,3,'crm_etlbot','adb',0,'2020-11-01 07:00:39','2020-11-01 07:00:39','2020-11-01 07:01:01','done',1,420,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_detail_call_transfers_delta();','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 06:01:45',1603984287,226486,4,'pricemonitoringv_etlbot','adb',0,'2020-11-01 06:01:03','2020-11-01 06:01:03','2020-11-01 06:01:25','done',1,0,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''PriceMonitoring'' and stl.table_name = ''lm_monitoringresults'';
                                    select metadata.fn_load_all_table(''pricemonitoringv2_raw'', 
                                                                      ''pricemonitoringv2_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''PriceMonitoring'' and stl.table_name = ''lm_monitoringresults'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:07:45',1603984287,226780,4,'crm_etlbot','adb',0,'2020-11-01 06:06:21','2020-11-01 06:06:21','2020-11-01 06:07:30','done',1,1400,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''phonecallbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''phonecallbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:19:30',1603984287,226994,4,'crm_etlbot','adb',0,'2020-11-01 06:09:43','2020-11-01 06:09:43','2020-11-01 06:19:15','done',1,1760,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''activitypointerbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''activitypointerbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 06:40:45',1603984287,228736,4,'nav_etlbot','adb',0,'2020-11-01 06:36:15','2020-11-01 06:36:15','2020-11-01 06:40:29','done',1,9770,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__unit'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__unit'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:12:30',1603984287,216640,4,'tpnet_etlbot','adb',0,'2020-11-01 03:11:38','2020-11-01 03:11:38','2020-11-01 03:12:15','done',1,680,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''txsalelineitem'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00143_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00143_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''txsalelineitem'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:12:30',1603984287,216648,4,'tpnet_etlbot','adb',0,'2020-11-01 03:11:51','2020-11-01 03:11:51','2020-11-01 03:12:11','done',1,580,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''item'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00143_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00143_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 143'' and stl.table_name = ''item'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:19:00',1603984287,217008,3,'marts_etlbot','adb',0,'2020-11-01 03:17:55','2020-11-01 03:17:55','2020-11-01 03:18:49','done',1,910,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:33:30',1603984287,217790,3,'marts_etlbot','adb',0,'2020-11-01 03:31:53','2020-11-01 03:31:53','2020-11-01 03:33:15','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-04''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 03:41:30',1603984287,218224,4,'nav_etlbot','adb',0,'2020-11-01 03:38:36','2020-11-01 03:38:36','2020-11-01 03:41:23','done',1,8160,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__unit'';
                                    select metadata.fn_load_all_table(''nav_navsql035_store035_raw'', 
                                                                      ''nav_navsql035_store035_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''NAV035'' and stl.table_name = ''whse__doc__unit'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:47:00',1603984287,218696,3,'marts_etlbot','adb',0,'2020-11-01 03:46:09','2020-11-01 03:46:09','2020-11-01 03:46:51','done',1,880,0.0,0.0,0.0,0,'select hi42_marts.fn_load_hi42_targets(''2020-01-01''::date, ''2020-12-31''::date);','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 04:02:00',1603984287,219683,3,'crm_etlbot','adb',0,'2020-11-01 04:01:23','2020-11-01 04:01:23','2020-11-01 04:01:43','done',1,230,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_incidents_detail_delta();','','','Unknown','Unknown'),
	 ('2020-11-01 04:08:45',1603984287,220101,3,'marts_etlbot','adb',0,'2020-11-01 04:07:45','2020-11-01 04:07:45','2020-11-01 04:08:24','done',1,9350,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-09''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:28:15',1603984287,221393,3,'marts_etlbot','adb',0,'2020-11-01 04:27:19','2020-11-01 04:27:19','2020-11-01 04:27:53','done',1,8830,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-12''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:37:45',1603984287,221891,3,'marts_etlbot','adb',0,'2020-11-01 04:36:11','2020-11-01 04:36:11','2020-11-01 04:37:33','done',1,0,0.0,0.0,0.0,0,'set optimizer = off; select hi42_marts.fn_load_hi42_union(''2020-10-13''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 05:17:30',1603984287,224100,2,'zkp-mart-dev','adb',0,'2020-11-01 05:15:37','2020-11-01 05:15:37','2020-11-01 05:17:12','done',1,2090,0.0,0.0,0.0,0,'SELECT sandbox_synoptique.calc_t_items_stores();','','','Unknown','Unknown'),
	 ('2020-11-01 01:33:45',1603984287,211418,4,'cds_etlbot','adb',0,'2020-11-01 01:30:16','2020-11-01 01:30:16','2020-11-01 01:33:29','done',1,720,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'';
                                    select metadata.fn_load_all_table(''cds_raw'', 
                                                                      ''cds_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CustomerDeliverySystem'' and stl.table_name = ''route_track'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:42:30',1603984287,212009,4,'tpnet_etlbot','adb',0,'2020-11-01 01:41:38','2020-11-01 01:41:38','2020-11-01 01:42:09','done',1,640,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_efttransaction'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00030_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00030_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 30'' and stl.table_name = ''txlm_efttransaction'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:45:45',1603984287,212070,52,'marts_etlbot','adb',0,'1970-01-01 03:00:00','2020-11-01 01:43:24','2020-11-01 01:45:24','done',0,291390,0.0,1.1,0.61,0,'','','','',''),
	 ('2020-11-01 01:52:45',1603984287,212445,3,'marts_etlbot','adb',0,'2020-11-01 01:50:10','2020-11-01 01:50:10','2020-11-01 01:52:28','done',1,20060,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00016_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''16'', ''2020-09-23''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 01:59:45',1603984287,212619,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:47','2020-11-01 01:53:47','2020-11-01 01:59:32','done',1,740,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown');
INSERT INTO queries_history (ctime,tmid,ssid,ccnt,username,db,"cost",tsubmit,tstart,tfinish,status,rows_out,cpu_elapsed,cpu_currpct,skew_cpu,skew_rows,query_hash,query_text,query_plan,application_name,rsqname,rqppriority) VALUES
	 ('2020-11-01 01:59:45',1603984287,212759,4,'tpnet_etlbot','adb',0,'2020-11-01 01:57:46','2020-11-01 01:57:46','2020-11-01 01:59:30','done',1,630,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_posidentityextension'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_posidentityextension'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:50:45',1603984287,212431,4,'tpnet_etlbot','adb',0,'2020-11-01 01:49:57','2020-11-01 01:49:57','2020-11-01 01:50:37','done',1,680,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txcomment'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txcomment'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:59:00',1603984287,212589,4,'tpnet_etlbot','adb',0,'2020-11-01 01:53:10','2020-11-01 01:53:10','2020-11-01 01:58:45','done',1,730,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_salelineitempayments'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00035_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00035_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 35'' and stl.table_name = ''txlm_salelineitempayments'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:59:00',1603984287,212768,4,'tpnet_etlbot','adb',0,'2020-11-01 01:58:07','2020-11-01 01:58:07','2020-11-01 01:58:50','done',1,580,0.0,0.0,0.25,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_efttransaction'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txlm_efttransaction'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 01:59:15',1603984287,212794,4,'tpnet_etlbot','adb',0,'2020-11-01 01:58:28','2020-11-01 01:58:28','2020-11-01 01:58:56','done',1,700,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txdiscinfo'';
                                    select metadata.fn_load_all_table(''tpnet_tpnsql00032_tpcentraldb_raw'', 
                                                                      ''tpnet_tpnsql00032_tpcentraldb_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''TP.NET 32'' and stl.table_name = ''txdiscinfo'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:08:45',1603984287,216307,4,'crm_etlbot','adb',0,'2020-11-01 03:06:36','2020-11-01 03:06:36','2020-11-01 03:08:25','done',1,1360,0.0,0.0,0.0,0,'SELECT 1/count(*) as tbl_exist
                                    FROM metadata.t_scd4_table_list stl 
                                    INNER JOIN metadata.t_scd4_source_list ssl
                                    ON stl.id_source = ssl.id_source
                                    WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postregardingbase'';
                                    select metadata.fn_load_all_table(''crm_o_crm_dbag_lm_mscrm_dbo_raw'', 
                                                                      ''crm_o_crm_dbag_lm_mscrm_dbo_ods'', 
                                                                      (SELECT stl.id_table
                                                                       FROM metadata.t_scd4_table_list stl 
                                                                       INNER JOIN metadata.t_scd4_source_list ssl
                                                                       ON stl.id_source = ssl.id_source
                                                                       WHERE ssl.source_name = ''CRM'' and stl.table_name = ''postregardingbase'')::text,
                                                                       ''delta'',
                                                                       ''1'',
                                                                       10000000,
                                                                       (select now() - interval ''5 minute'')::text)','','','Unknown','Unknown'),
	 ('2020-11-01 03:21:15',1603984287,217083,3,'marts_etlbot','adb',0,'2020-11-01 03:19:41','2020-11-01 03:19:41','2020-11-01 03:20:55','done',1,9810,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-03''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:01:30',1603984287,219557,3,'crm_etlbot','adb',0,'2020-11-01 03:59:26','2020-11-01 03:59:26','2020-11-01 04:01:13','done',1,2320,0.0,0.0,0.0,0,'select crm_o_crm_dbag_lm_mscrm_dbo_mart.fn_load_incidents_delta();','','','Unknown','Unknown'),
	 ('2020-11-01 04:01:30',1603984287,219648,3,'marts_etlbot','adb',0,'2020-11-01 04:00:45','2020-11-01 04:00:45','2020-11-01 04:01:22','done',1,10410,0.0,0.0,0.0,0,'set search_path to tpnet_tpnsql00088_tpcentraldb_ods; select hi42_marts.fn_load_ticcai_lines_ticket_date(''88'', ''2020-10-08''::date);','','','Unknown','Unknown'),
	 ('2020-11-01 04:01:30',1603984287,219629,2,'zkp-mart-dev','adb',0,'2020-11-01 04:00:21','2020-11-01 04:00:21','2020-11-01 04:01:16','done',1,480,0.0,0.0,0.0,0,'SELECT sandbox_synoptique.update_ligticcai_resell(''2020-10-24'',''2020-10-31'');','','','Unknown','Unknown');



SELECT *
FROM queries_history