import \
    --connect jdbc:oracle:thin:@<pas-oracle-db-host>:1521/<service_name> \
    --username <pas_user> \
    --password-file hdfs:///user/hadoop/secure/pas.password \
    --table POLICIES \
    --where "MOD(policy_id, ${num_mappers}) = ${mapper_id}" \
    --target-dir /user/hive/warehouse/policies_raw \
    --as-parquetfile \
    --split-by policy_id \
    -m 16 \
    --hive-import \
    --hive-database default \
    --hive-table policies_raw \
    --hive-overwrite