# ovt-data-pipeline

This repository contains the configuration directives to run the 
[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for the
[FuTRES project](https://futres.org/).

To get started, follow the installation instructions at [ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline). 

Once everything is installed, you should be able to simply run:  

```  
pytest 
```

If the above fails then either you do not have pytest installed on your system or the installation did not proceed.  Install pytest with ```pip install pytest```

If you had success, then you can proceed with processing data, for example:

```  
./run.sh vertnet
```



