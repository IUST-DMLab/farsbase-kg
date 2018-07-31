echo "Going to install Utils"
cd essential
cd utils
mvn clean install

cd ..
cd raw
cd JHazm
cd core
mvn clean install

cd ..
cd ..
cd nlp-utils
mvn clean install

cd ..
cd ..
cd essential
cd knowledge-core
mvn clean
mvn install -Dmaven.test.skip=true

cd ..
cd virtuoso-connector
cd connector
mvn clean install


echo "Going to install Resource Extractor and Its services"
cd ..
cd ..
cd extractor
cd resource-extractor
mvn clean install

cd ..
cd resource-extractor-services
mvn clean install


echo "Going to install Knowledge Store and Expert"
cd ..
cd ..
cd ..
cd store
cd knowledge-store
mvn clean install

cd ..
cd knowledge-expert
mvn clean install


echo "Going to install Knowledge Runner"
cd ..
cd ..
cd update
cd knowledge-runner
mvn clean install

echo "You must restart these servers before continue:"
echo "1. Resource Extractor Services"
echo "2. Knowledge Store"
echo "3. Knowledge Runner"
echo "Please restart all of them and then run install_services.sh"
