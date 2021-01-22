# fovt-data-pipeline

This repository contains the configuration directives to run the 
[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for the
[FuTRES project](https://futres.org/) using the FuTRES Ontology for Vertebrate Traits ([FOVT](https://github.com/futres/fovt)).


# Getting Started
[Install docker](https://docs.docker.com/install/) and then clone this repository.  Once that is done, you can test
the environment by using the following script, which demonstrates calling docker and running the necessary commands.
It uses the provided `sample_data_processed.csv` file and a sample ontology:

```
# This is a script to demonstrate a working version of the pipeline
# The ontology and the data is referenced here just for purposes of illustration

# Note that in the command usage below, the current working ($pwd) is aliased
# to /process so a reference to the directory of /process/sample really points
# to the sample directory in this repository

# check that we have the latest ... this may take awhile the first time through
docker pull jdeck88/ontology-data-pipeline

docker run -v "$(pwd)":/process -w=/app -ti jdeck88/ontology-data-pipeline \
    python pipeline.py \
    -v --drop_invalid \
    /process/sample_data_processed.csv \
    /process/data/output \
    https://raw.githubusercontent.com/futres/fovt/597a56be6f481de2c0320db023f0ac0543724880/ontology/fovt-merged-reasoned.owl \
    /process/config \
```
After the test runs, you should see output that ends with:
```
...
INFO:root:b'    writing /process/test_data/vertnet/output/output_reasoned_csv/data_1.ttl.csv\n'
INFO:root:reasoned_csv output at test_data/vertnet/output/output_reasoned_csv/data_1.ttl.csv
```

You can also try running the sample script using python directly.  To do this, checkout ontology-data-pipeline and place
at ```../ontology-data-pipeline``` and the run like:

```
# a sample_runner script running python directly, 
# assuming that you have ontology-data-pipeline checkout
    python ../ontology-data-pipeline/process.py \
    -v --drop_invalid \
    sample_data_processed.csv \
    data/output \
    https://raw.githubusercontent.com/futres/fovt/597a56be6f481de2c0320db023f0ac0543724880/ontology/fovt-merged-reasoned.owl \
    config \
```

Once you have verified things work using the sample script script, you can then run data through the pipeline from 
the command line using the run.sh script yourself.  We have provided an empty data directory as part of this 
distribution to store data, but you may direct output anywhere you choose.


If you want to modify configuration settings, refer to [ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for instructions.



