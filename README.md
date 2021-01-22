# fovt-data-pipeline

This repository contains the configuration directives to run the 
[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for the
[FuTRES project](https://futres.org/) using the FuTRES Ontology for Vertebrate Traits ([FOVT](https://github.com/futres/fovt)).  Configuration directives for running the ontology-data-pipeline are stored in the `config/` directory.


# Running with Docker
This is the reccomended route.
First, [Install docker](https://docs.docker.com/install/) and then clone this repository.  Once that is done, you can test
the environment by using the following script, which demonstrates calling docker and running the necessary commands.
It uses the provided `sample_data_processed.csv` file and a sample ontology:

```
./my.run.sh
# You will see some output text, ending with something like this:
...
INFO:root:reasoned_csv output at data/output/output_reasoned_csv/data_1.ttl.csv
```
*NOTE:* you must reference your input data file to reason within the root-level of this repository. Preferably under the `data/` directory.
The docker image cannot files like `../some-other-directory/file.txt`.  The

The above script calls `run.sh` which executes a docker pull (to check for latest image), and then
runs the script in the local environment.  You can view the contents of run.sh using `more run.sh` to get an
idea of how to structure your own script if you choose.

# Running with Python instead of Docker
You can also try running the sample script using python directly.  To do this, checkout[ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline)  and place at ```../ontology-data-pipeline``` and the run like:

```
# a sample_runner script running python directly assuming that you have ontology-data-pipeline checked out
# in the proper location
    python ../ontology-data-pipeline/process.py \
    -v --drop_invalid \
    sample_data_processed.csv \
    data/output \
    https://raw.githubusercontent.com/futres/fovt/597a56be6f481de2c0320db023f0ac0543724880/ontology/fovt-merged-reasoned.owl \
    config \
```

# Working with the repository
Once you have verified things work using the sample script script, you can then run data through the pipeline from 
the command line using the tools mentioned above and using your own input datasources.  We have provided an empty data directory as part of this  distribution to store data, but you may direct output anywhere you choose.

If you want to modify configuration settings, refer to [ontology-data-pipeline](https://github.com/biocodellc/ontology-data-pipeline) for instructions.



