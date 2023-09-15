#!/bin/bash

docker exec -it faststream-gen-template-kafka-1 /opt/bitnami/kafka/bin/kafka-console-consumer.sh --consumer.config /opt/bitnami/kafka/config/consumer.properties --bootstrap-server kafka:9092 --topic results --from-beginning
