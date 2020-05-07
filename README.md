# Apache Livy Docker Container

Based on the latest release of the [Apache Livy project](https://livy.incubator.apache.org/)

------

### Supported Versions:

Apache Spark: 2.4.4

------

### Configuration

Required environment variables:

- SPARK_MASTER_ENDPOINT => Spark Master IP
- SPARK_MASTER_PORT => Spark Master Port
- DEPLOY_MODE => *client* for PySpark applications and preferably *cluster* for Java/Scala applications 

Per default the /tmp folder is configured as path for submitting local files via Livy Server

Livy Server start on default port 8998

------

### Usage:

```bash
docker run -p 8998:8998 -e SPARK_MASTER_ENDPOINT=spark -e SPARK_MASTER_PORT=7077 -e DEPLOY_MODE=client davlum/livy:0.7.0-spark2.4.4
```



