# ovt-data-pipeline

This repository contains the configuration directives to run the 
[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for the
[FuTRES project](https://futres.org/).

To get started, follow the installation instructions at [ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline). 

Once everything is installed, proceed to the root directory of the code you have checked out and run the following

```  
pip install -r requirements.txt  
pytest 
```

If the above fails you must stop and figure out what happened and fix it. 
If you had succcess you can look at the output in the in the following directory ```test_data/vertnet/output/output_reasoned_csv/```

After the tests have been run, you can now process real data using the run.sh script, like:
```  
./run.sh vertnet
```



