#!/bin/bash

../spark3/bin/spark-shell \
            --jars ../spark-sql-perf/target/scala-2.12/spark-sql-perf_2.12-0.5.1-SNAPSHOT.jar \
            --packages io.delta:delta-core_2.12:1.1.0 \
            --conf "spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension" \
            --conf "spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog" \
            --master local-cluster[2,2,4096] \
            --conf "spark.executor.memory=4000M" \
            --deploy-mode client \
            -i ./TPCH_22_parquet_Queries.scala
