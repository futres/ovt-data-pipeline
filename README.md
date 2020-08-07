# fovt-data-pipeline

This repository contains the configuration directives to run the 
[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for the
[FuTRES project](https://futres.org/) using the FuTRES Ontology for Vertebrate Traits ([FOVT](https://github.com/futres/fovt)).


# Getting Started
[Install docker](https://docs.docker.com/install/) and then clone this repository.  Once that is done, you can enter the following:

```
./sample_runner.sh 
```

The above script first checks for the latest docker image.  This may take awhile to install the ontology-data-pipeline image on the first run.
After the test runs, you should see output that ends with:

```
...
INFO:root:b'    writing /process/test_data/vertnet/output/output_reasoned_csv/data_1.ttl.csv\n'
INFO:root:reasoned_csv output at test_data/vertnet/output/output_reasoned_csv/data_1.ttl.csv
```

You can also try running the sample script using python directly.  To do this, checkout ontology-data-pipeline and place
at ```../ontology-data-pipeline``` and the run like:

```
./sample_runner_py.sh
```

Once you have verified things work using test script, you can then run data through the pipeline using:
```
./run.sh {INPUT_DATAFILE} {OUTPUT_DIRECTORY}
```

An example of running the above command would look like:
```
./run.sh data/ray/ray_data_full.csv data/ray/output
```
This looks for a data file called "ray_data_full.csv" and writes output to data/ray/output

This repository contains all of the configuration files needed to process data.  If you want to modify configuration settings, 
refer to [ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for instructions.



