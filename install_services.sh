echo "Going to install Service Utils"
echo "You must restart these servers before continue:"
echo "1. Resource Extractor Services"
echo "2. Knowledge Store"
echo "3. Knowledge Runner"
echo "Please restart all of them and then run this script"
cd essential
cd service-utils
cd knowledge-store
mvn clean install

cd ..
cd resource-extractor
mvn clean install

cd ..
cd knowledge-runner
mvn clean install

cd ..
cd ontology-tree
mvn clean install -Dmaven.test.skip=true


echo "Going to install Proxy"
cd ..
cd ..
cd ..
cd proxy
mvn clean install


echo "Going to install Ontology/Mapping services"
cd ..
cd mapper
mvn clean install


echo "Going to install Raw text services"
cd ..
cd raw
cd raw-text-access
mvn clean install

cd ..
cd parse-tree-extractor
mvn clean install

cd ..
cd rule-based-extractor
mvn clean install

cd ..
cd distant-supervision-re
mvn clean install

cd ..
cd raw-triple-extractor
mvn clean install

cd ..
cd raw-text-services
mvn clean install


echo "Going to install Search services"
cd ..
cd ..
cd search
cd search-normalizer
mvn clean install

cd ..
cd log-analyzer
mvn clean install

cd ..
cd searcher
mvn clean install

cd ..
cd search-services
mvn clean install

cd ..
cd search-feedback
mvn clean install

cd ..
cd search-evaluation
mvn clean install

cd ..
cd evaluation-services
mvn clean install

cd ..
cd ..
cd update
cd update_manager
mvn clean install

echo "Going to install GUI projects"
cd ..
cd ..
cd gui
cd evaluation-ui
npm install

cd ..
cd expert-ui
npm install

cd ..
cd kg-ui
npm install

cd ..
cd mapping-ui
npm install

cd ..
cd pkg-ui
npm install
bower install

cd ..
cd raw-text-ui
npm install

cd ..
cd search-ui
npm install
