#!/bin/bash
# Currently we use this script instead update manager and knowledge runner.
# Change the pathes in this script with your own pathes.
date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Checking wiki dump is available"

cd /opt/ogr/wiki-extractor/
python3 main.py

VIRTUOSO_PASS="dba"
DATE=$(date +"%m_%d_%Y")
GRAPH="http://fkg.iust.ac.ir/"

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Restart Mongo"
#echo -e "passwrd\n" | sudo -S service mongod restart
sudo service mongo restart
sleep 20

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Restart Knowledge Store"
#kill -9 `ps aux | grep knowlede-store-services | head -n 2 | awk '{print $2}'`
#java -jar /opt/ogr/knowlede-store-services.jar &
sudo service kgstore restart
bg
disown

sleep 20
date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Restart Knowledge Store"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
echo "Updating Step: Starting mapping all wiki parts to file triple store"
mv /opt/ogr/data/triple_store/ /opt/ogr/data/triple_store_$DATE
java -jar /opt/ogr/mapper/mapper.jar completeDumpUpdate file

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Moving triples from file store to knowlege store"
java -jar /opt/ogr/mapper/mapper.jar fileToStore

#echo -e "passwrd\n" | sudo -S service mongod restart
sudo service mongo restart

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Migrating triples from store to Virtuoso and TTL folder"
mkdir /opt/ogr/data/triples/$DATE
mkdir /opt/ogr/data/triples/$DATE/ttls
java -jar /opt/ogr/knowledge-export/knowlede-store-export.jar /data/triples/$DATE/ttls localhost 1111 dba $VIRTUOSO_PASS $GRAPH
rm /opt/ogr/data/triples/last
ln -s /opt/ogr/data/triples/$DATE /opt/ogr/data/triples/last

#echo -e "passwrd\n" | sudo -S service mongod restart
sudo service mongo restart
#echo -e "passwrd\n" | sudo -S service virtuoso restart
sudo service virtuoso-opensource-7 restart

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Making resource extractor cache"
java -jar /opt/ogr/resource-extractor/resource-extractor-services.jar store

# Reset Resource Extractor and Searcher after completing this update [Make first time by hand]

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Reset Knowledge Store after completing this update"
#kill -9 `ps aux | grep knowlede-store-services | head -n 2 | awk '{print $2}'`
#java -jar /opt/ogr/resource-extractor/knowlede-store-services.jar &
#bg
#disown
sudo service kgstore restart

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Reset Resource Extractor after completing this update"
#kill -9 `ps aux | grep extractor-services | head -n 2 | awk '{print $2}'`
#java -jar /opt/ogr/resource-extractor/resource-extractor-services.jar &
#bg
#disown
sudo service kgextractor restart

date "+%Y/%m/%d %H:%M:%S"
echo "Updating Step: Reset Search Services after completing this update"
#kill -9 `ps aux | grep search | head -n 2 | awk '{print $2}'`
#java -Xmx40g -jar /opt/ogr/searcher/search-service.jar &
#bg
#disown
sudo service kgsearch restart
