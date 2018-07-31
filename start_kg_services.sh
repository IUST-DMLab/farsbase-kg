#!/bin/sh
kill -9 `ps aux | grep evaluation_services | head -n 2 | awk '{print $2}'`
java -jar  search/evaluation-services/target/evaluation_services.jar &
bg
disown

kill -9 `ps aux | grep expert-web | head -n 2 | awk '{print $2}'`
java -jar -Xmx16g store/knowledge-expert/web/target/knowlede-expert-web.jar &
bg
disown

kill -9 `ps aux | grep search-feedback | head -n 2 | awk '{print $2}'`
java -jar  search/search-feedback/target/feedback.jar &
bg
disown

./virtuoso-start.sh
kill -9 `ps aux | grep mapper | head -n 2 | awk '{print $2}'`
java -jar mapper/runner/target/mapper.jar &
bg
disown

kill -9 `ps aux | grep knowlede-proxy-web | head -n 2 | awk '{print $2}'`
java -jar proxy/web/target/knowlede-proxy-web.jar &
bg
disown

kill -9 `ps aux | grep raw-text | head -n 2 | awk '{print $2}'`
java -jar  raw/raw-text-services/target/raw-services.jar &
bg
disown


kill -9 `ps aux | grep raw-text | head -n 2 | awk '{print $2}'`
java -jar -Xmx40g search/search-services/target/search-service.jar &
bg
disown
