#!/bin/bash

docker exec -it bitnami_kafka /bin/bash -c 'echo \{\"a\":3,\"b\":5\} | /opt/bitnami/kafka/bin/kafka-console-producer.sh --broker-list kafka:9092 --topic multiply'

docker exec -it bitnami_kafka /bin/bash -c 'echo \{\"a\":4,\"b\":6\} | /opt/bitnami/kafka/bin/kafka-console-producer.sh --broker-list kafka:9092 --topic multiply'

docker exec -it bitnami_kafka /bin/bash -c 'echo \{\"a\":5,\"b\":7\} | /opt/bitnami/kafka/bin/kafka-console-producer.sh --broker-list kafka:9092 --topic multiply'
