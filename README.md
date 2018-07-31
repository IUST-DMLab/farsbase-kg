# Get Codes
You must know Git technology to get the codes: 
The git server is GitHub.

A user has been created for ITRC to get all codes:
username: USERNAME


download the code resursively:

```bash
git clone --recursive git@github.com:IUST-DMLab/farsbase-kg.git
```

You can update all of code to the last version just by calling this command:
```bash
git submodule update --recursive --remote
```

# Install all Java/GUI modules
to install all Java/GUI modules, make sure you have `mvn` and `npm` in 
your system path. Then just run `bash install_essentials.sh` script. It may
take a while to install all essential Java modules. After that, run
Knowledge Store and Knowledge Runner services and the run 
`bash install_services.sh` to complete code installation. now you can run other
services.

## Pyhton
Wikipedia Extractor and News Crawler has been written in Python language.
You can get the codes from these addresses:

```bash
https://github.com/IUST-DMLab/wiki-extractor
(git@github.com:IUST-DMLab/wiki-extractor.git)
```

You can create an SSH key in the site and get the project with this command:
```bash
git clone git@github.com:IUST-DMLab/wiki-extractor.git
```
You can use this method to get all of other projects.

to prepare the develop envirounment, run this code:
```bash
sudo apt-get install python3-pip
sudo pip install –-upgrade pip
sudo pip3 install –-upgrade pip
cd wiki-extractor
sudo pip3 install -r requirements.txt
```

run this code if you get error about `typing` library:
```bash
sudo pip3 install --upgrade typing
```

config folder of wiki output in `update.python`:
```python
DESTINATION_DIR = '/media/sdb/extractedWikiInfo'
```

to getting update, schedule (like crontab) running of below command each day
```bash
python3 /opt/fkg/python/wiki-extractor/main.py
```
## Java
You must know about these technology to compile the codes:
1. Java Programming
1. Maven build tool

And you must know about these technologies to master the codes:
1. Spring Framework
1. Spring Boot Core
1. MongoDB and Spring Boot Data
1. Rest Services and Spring Boot Web
1. Kotlin Language (Mapper and Utils projects)

### Compiling the projects
All projects can be compiled with maven build tool.

Here are the Git-SSH address of each projects, In each cases, you must cd to 
the folder which contains pom.xml file and run `mvn install` to compile the 
code. In some projects like (service-utils) we have multiple modules in the 
folder and you must run install for each modules, but most of projects have a 
parent module and running mvn install on parent, compiles other submodules too.

#### Essentials Projects
```bash
https://github.com/IUST-DMLab/utils.git
https://github.com/IUST-DMLab/knowledge-core.git
https://github.com/IUST-DMLab/service-utils.git
https://github.com/IUST-DMLab/virtuoso-connector.git
https://github.com/IUST-DMLab/resource-extractor.git
https://github.com/IUST-DMLab/resource-extractor-services.git
```

#### Knowledge Storing
```bash
https://github.com/IUST-DMLab/knowledge-store.git
https://github.com/IUST-DMLab/knowledge-expert.git
```

#### Raw
```bash
https://github.com/IUST-DMLab/JHazm.git
https://github.com/IUST-DMLab/nlp-utils.git
https://github.com/IUST-DMLab/raw-text-access.git
https://github.com/IUST-DMLab/distant-supervision-re.git
https://github.com/IUST-DMLab/rule-based-extractor.git
https://github.com/IUST-DMLab/parse-tree-extractor.git
https://github.com/IUST-DMLab/raw-text-services.git
https://github.com/IUST-DMLab/raw-triple-extractor.git
```

#### Mapper and Ontology Services
```bash
https://github.com/IUST-DMLab/mapper.git
```

#### Search
```bash
https://github.com/IUST-DMLab/search-normalizer.git
https://github.com/IUST-DMLab/log-analyzer.git
https://github.com/IUST-DMLab/searcher.git
https://github.com/IUST-DMLab/search-services.git
https://github.com/IUST-DMLab/search-feedback.git
https://github.com/IUST-DMLab/search-evaluation.git
https://github.com/IUST-DMLab/evaluation-services.git
```

##### Export data from store

Export TTLs:
```bash
java -jar knowlede-store-export.jar
```
and see the manual

Create resource extractor cache from knowledge store:
```bash
cd essential/resource-extractor-services
java -jar target/resource-extractor-services.jar store
```

download and put recommendation database to mysql database.

put cache and ttls folder in wroking directory of search-services.

set configurations:
```properties
searcher.blacklist=/data/triples/last/black_list.txt
searcher.cache.dir=/data/triples/last/cache
searcher.ttl.dir=/data/triples/last/ttls
recommendation.sql.password=mysql_pass
recommendation.sql.user=root
# virtuoso address and credentials.
virtuoso.address=localhost\:1111
virtuoso.graph=http\://farsbase.net/
virtuoso.host=localhost
virtuoso.password=password
virtuoso.port=1111
virtuoso.user=dba
```

and run seearch service:
```bash
java -jar target/search-service.jar
```
#### Update Management
```bash
git@dmls.iust.ac.ir:hossein.khaledi/knowledge-runner.git
git@dmls.iust.ac.ir:majid.asgari/update_manager.git
```

##### Manual Wiki Update
check `update.sh` script.

#### Proxy
```bash
git@dmls.iust.ac.ir:hossein.khaledi/proxy.git
```

## GUI
You must know about these technology to deploy the codes:
1. HTML / CSS / Javascript
1. NodeJS
1. Bower

```bash
https://github.com/IUST-DMLab/evaluation-ui.git
https://github.com/IUST-DMLab/expert-ui.git
https://github.com/IUST-DMLab/kg-ui.git
https://github.com/IUST-DMLab/mapping-ui.git
https://github.com/IUST-DMLab/pkg-ui.git
https://github.com/IUST-DMLab/raw-text-ui.git
https://github.com/IUST-DMLab/search-ui.git
```

# How to RUN

You must run this jar files in sequence (After running press Ctrl+Z, run `bg` 
command and then `disown` to allow linux to run the command in background. 
You can close terminal emulator after this commands)
You must configure the system before running the files (next section).

See `start_essential_services.sh` and `start_kg_services.sh` scripts to see how you can run the jar files.

# Configurations
You must configure the system before running that. You must create 
config.properties file (if it is not existed) in this folder:
```bash
/srv/.pkg/config.properties
$HOME/.pkg/config.properties # if /srv/.pkg/config.properties file is not existed.
``

The file contain some keys and some values. Here is the description of each values:

```properties
# knowledge runner address.
knowledge.runner.url=http\://localhost\:8102/rs
# knowledge store address.
knowledge.store.url=http\://localhost\:8091/rs
# resource extractor address.
resource.extractor.url=http\://localhost\:8094
# Python crawler output address, Raw text extractor scans this folder and find new crawled texts and run raw text modules on it.
raw.extractor.crawler.folder=/data/crawler
# Raw text extractor output folder. Its input folder is crawler output path
raw.extractor.output.folder=/data/updater/raw
# raw.folder.input is same as raw.extractor.output.folder. Updater scans a folder (like /data/updater) and use that folder for updates. This address must contains export folder of tables (tables.folder), wiki(wiki.folder.*) and raw text (raw.extractor.output.folder) moules.
raw.folder.input=/data/updater/raw
tables.folder=/data/updater/raw
# Wiki export addresses. Other modules may using this address. For example raw text modules uses wiki text (wiki.folder.texts) for disambiguation process.
wiki.folder.abstracts=/data/updater/wiki/VERSION/abstracts
wiki.folder.disambiguations=/data/updater/wiki/VERSION/disambiguations
wiki.folder.redirects=/data/updater/wiki/VERSION/redirects
wiki.folder.texts=/data/updater/wiki/VERSION/texts
wiki.folder.tuples=/data/updater/wiki/VERSION/tuples
wiki.folder.with.info.box=/data/updater/wiki/VERSION/with_infobox
wiki.folder.without.info.box=/data/updater/wiki/VERSION/without_infobox
```

## Updating
We are using `update.sh` script to update the KG. In future we will use `knowledge-runner` and `update_manager` project for updating process.

## Proxy config
Go to proxy UI (localhost/pkg), login with default credentials (`superuser` and `superuser`)
and configure.

Assign permission to users. Each user must logout and login to apply their permissions.

# Services
Service scrtipts are here:
```bash
/usr/lib/systemd/system/
```

For example search servcice:
```bash
search.service
```

You can start or stop services:
```bash
sudo systemctl start search.service
```

After any editing in services, reload the daemons:
```bash
 sudo systemctl daemon-reload
 ```
