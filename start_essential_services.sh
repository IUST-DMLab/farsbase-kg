#!/bin/sh
kill -9 `ps aux | grep resource-extractor-services | head -n 2 | awk '{print $2}'`
java -jar /codes/essential/resource-extractor-services/target/resource-extractor-services.jar &
bg
disown

kill -9 `ps aux | grep knowlede-store-services | head -n 2 | awk '{print $2}'`
java -jar /codes/store/knowledge-store/services/target/knowlede-store-services.jar &
bg
disown

kill -9 `ps aux | grep knowlede-runner-services | head -n 2 | awk '{print $2}'`
java -jar /codes/update/knowledge-runner/services/target/knowlede-runner-services.jar &
bg
disown


