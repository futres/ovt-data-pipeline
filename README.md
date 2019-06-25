# fovt-data-pipeline

This repository contains the configuration directives to run the 
[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for the
[FuTRES project](https://futres.org/) using the FuTRES Ontology for Vertebrate Traits ([FOVT] (https://github.com/futres/fovt)).

There are two ways to get started...

# Docker Method:
[Install docker](https://docs.docker.com/install/) and then clone this repository.  Once that is done, you can enter the following:
```
./run_test_docker.sh vertnet
```
The above runs a small test project through the pipeline... you should see output that ends with:
```
...
INFO:root:reasoned output at test_data/vertnet/output/output_reasoned/data_1.ttl
DEBUG:root:	running csv2reasoner on data_1.ttl
DEBUG:root:converting reasoned data to csv for file /process/test_data/vertnet/output/output_reasoned/data_1.ttl
DEBUG:root:running query_fetcher with:
DEBUG:root:java -jar /app/process/../lib/query_fetcher-0.0.1.jar -i /process/test_data/vertnet/output/output_reasoned/data_1.ttl -inputFormat TURTLE -o /process/test_data/vertnet/output/output_reasoned_csv -numThreads 1 -sparql /process/config/fetch_reasoned.sparql
INFO:root:b'    writing /process/test_data/vertnet/output/output_reasoned_csv/data_1.ttl.csv\n'
INFO:root:reasoned_csv output at test_data/vertnet/output/output_reasoned_csv/data_1.ttl.csv
```
You can find the docker image at [Docker Hub](https://cloud.docker.com/u/jdeck88/repository/docker/jdeck88/ontology-data-pipeline)

Once you have verified things work using the test procedure above, you can then run data through the pipeline using:
```
./run_docker.sh vertnet
```

# Non-docker Method:

Follow the installation instructions at [ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline). 

Once everything is installed, proceed to the root directory of the code you have checked out and run the following

```  
pip install -r requirements.txt  
python -m pytest 
```

If the above fails you must stop and figure out what happened and fix it. 
If you had succcess you can look at the output in the in the following directory ```test_data/vertnet/output/output_reasoned_csv/```

After the tests have been run, you can now process real data using the run.sh script, like:
```  
./run.sh vertnet
```



