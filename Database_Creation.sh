source ~/.bash_profile

source $commonConfigurationFilePath
dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL

insert into sys_param (description, tag, value, feature_name) SELECT 'The msisdn prefixes used to validate the dump files received from operators. The values can be comma-separated in case of multiple prefixes.', 'msisdnPrefix', '855', 'List Management' FROM dual WHERE NOT EXISTS ( SELECT * FROM sys_param WHERE tag = 'msisdnPrefix');
insert into sys_param (description, tag, value, feature_name) SELECT 'The imsi prefixes used to validate the dump files received from operators. The values can be comma-separated in case of multiple prefixes.', 'imsiPrefix', '456', 'List Management' FROM dual WHERE NOT EXISTS ( SELECT * FROM sys_param WHERE tag = 'imsiPrefix');

insert ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5100", "The HLR deactivation file not found at path <e> for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5101", "The HLR deactivation file <e> does not contain IMSI for the operator <process_name>", "HLR_Deactivation_Dump");
insert  ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5102", "The HLR deactivation file <e> does not contain MSISDN for the operator <process_name>", "HLR_Deactivation_Dump");
insert  ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5103", "The HLR deactivation file <e> does not contain deactivation_date for the operator <process_name>", "HLR_Deactivation_Dump");
insert  ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5104", "The HLR deactivation file <e> failed IMSI prefix validation for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5105", "The HLR deactivation file <e> failed MSISDN prefix validation for operator <process_name>", "HLR_Deactivation_Dump");
insert  ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5106", "The HLR deactivation file <e> failed for uniqueness for pair for IMSI and MSISDN for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5107", "Null exists in HLR deactivation file <e> for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5108", "The process failed for HLR deactivation with an exception <e> for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5109", "The HLR deactivation file <e> failed for unique values for MSISDN for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5110", "Non-Numeric exists in HLR deactivation file <e> for operator <process_name>", "HLR_Deactivation_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5111", "The HLR deactivation file <e> failed for uniqueness of IMSI for operator <process_name>", "HLR_Deactivation_Dump");
insert  ignore into cfg_feature_alert (alert_id, description, feature) SELECT "alert5001", "The values for either IMSI Prefix or MSISDN prefix is missing in database.", "Sim_Change_Dump" FROM dual WHERE NOT EXISTS ( SELECT * FROM cfg_feature_alert WHERE alert_id = 'alert5001');
EOFMYSQL
