

ORC

SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/usr/local/apache-hive-3.1.2-bin/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/local/hadoop-3.2.1/share/hadoop/common/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
Hive Session ID = b5770b54-82e3-48e5-bb6a-37aa8f63dbe4

Logging initialized using configuration in jar:file:/usr/local/apache-hive-3.1.2-bin/lib/hive-common-3.1.2.jar!/hive-log4j2.properties Async: true
Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
Hive Session ID = 3e3f9fd1-5efb-4536-9be6-64d115fc58d3
hive> show databases;
OK
default
Time taken: 3.753 seconds, Fetched: 1 row(s)
hive> create table sales_order_data_csv_v1 ( ORDERNUMBER int, QUANTITYORDERED int, PRICEEACH float, ORDERLINENUMBER int, SALES float, STATUS string, QTR_ID int, MONTH_ID int, YEAR_ID int, PRODUCTLINE string, MSRP int, PRODUCTCODE string, PHONE string, CITY string, STATE string, POSTALCODE string, COUNTRY string, TERRITORY string, CONTACTLASTNAME string, CONTACTFIRSTNAME string, DEALSIZE string ) row format delimited fields terminated by ',' tblproperties("skip.header.line.count"="1") ;
OK
Time taken: 2.622 seconds
hive> load data local inpath 'file:///config/workspace/sales_order_data.csv' into table sales_order_data_csv_v1;
Loading data to table default.sales_order_data_csv_v1
OK
Time taken: 4.008 seconds
hive> create table sales_order_data_orc ( ORDERNUMBER int, QUANTITYORDERED int, PRICEEACH float, ORDERLINENUMBER int, SALES float, STATUS string, QTR_ID int, MONTH_ID int, YEAR_ID int, PRODUCTLINE string, MSRP int, PRODUCTCODE string, PHONE string, CITY string, STATE string, POSTALCODE string, COUNTRY string, TERRITORY string, CONTACTLASTNAME string, CONTACTFIRSTNAME string, DEALSIZE string ) stored as orc;
OK
Time taken: 0.503 seconds
hive> from sales_order_data_csv_v1 insert overwrite table sales_order_data_orc select *;
Query ID = abc_20230819205402_2e3a394e-5b8a-4eb6-939a-5e8d1f971d11
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1692458405641_0001, Tracking URL = http://bc9c04f9483c:8088/proxy/application_1692458405641_0001/
Kill Command = /usr/local/hadoop/bin/mapred job  -kill job_1692458405641_0001
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2023-08-19 20:54:39,518 Stage-1 map = 0%,  reduce = 0%
2023-08-19 20:54:59,301 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 15.23 sec
2023-08-19 20:55:12,153 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 18.35 sec
MapReduce Total cumulative CPU time: 18 seconds 350 msec
Ended Job = job_1692458405641_0001
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost/user/hive/warehouse/sales_order_data_orc/.hive-staging_hive_2023-08-19_20-54-02_134_7734011510697792485-1/-ext-10000
Loading data to table default.sales_order_data_orc
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 18.35 sec   HDFS Read: 400690 HDFS Write: 50366 SUCCESS
Total MapReduce CPU Time Spent: 18 seconds 350 msec
OK
Time taken: 74.969 seconds
hive> select * from sales_order_data_orc limit 10;
OK
10107   30      95.7    2       2871.0  Shipped 1       2       2003    Motorcycles     95      S10_1678        2125557818      NYC     NY      10022   USA     NA      Yu      Kwai    Small
10121   34      81.35   5       2765.9  Shipped 2       5       2003    Motorcycles     95      S10_1678        26.47.1555      Reims           51100   France  EMEA    Henriot Paul    Small
10134   41      94.74   2       3884.34 Shipped 3       7       2003    Motorcycles     95      S10_1678        +33 1 46 62 7555        Paris           75508   France  EMEA    Da Cunha        Daniel  Medium
10145   45      83.26   6       3746.7  Shipped 3       8       2003    Motorcycles     95      S10_1678        6265557265      Pasadena        CA      90003   USA     NA      Young   Julie   Medium
10159   49      100.0   14      5205.27 Shipped 4       10      2003    Motorcycles     95      S10_1678        6505551386      San Francisco   CA              USA     NA      Brown   Julie   Medium
10168   36      96.66   1       3479.76 Shipped 4       10      2003    Motorcycles     95      S10_1678        6505556809      Burlingame      CA      94217   USA     NA      Hirano  Juri    Medium
10180   29      86.13   9       2497.77 Shipped 4       11      2003    Motorcycles     95      S10_1678        20.16.1555      Lille           59000   France  EMEA    Rance   Martine Small
10188   48      100.0   1       5512.32 Shipped 4       11      2003    Motorcycles     95      S10_1678        +47 2267 3215   Bergen          N 5804  Norway  EMEA    Oeztan  Veysel  Medium
10201   22      98.57   2       2168.54 Shipped 4       12      2003    Motorcycles     95      S10_1678        6505555787      San Francisco   CA              USA     NA      Murphy  Julie   Small
10211   41      100.0   14      4708.44 Shipped 1       1       2004    Motorcycles     95      S10_1678        (1) 47.55.6555  Paris           75016   France  EMEA    Perrier Dominique       Medium
Time taken: 0.931 seconds, Fetched: 10 row(s)
hive>

