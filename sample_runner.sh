# This is a script to demonstrate a working version of the pipeline
# The ontology and the data is referenced here just for purposes of illustration

# Note that in the command usage below, the current working ($pwd) is aliased
# to /process so a reference to the directory of /process/sample really points
# to the sample directory in this repository

# check that we have the latest ...
docker pull jdeck88/ontology-data-pipeline

docker run -v "$(pwd)":/process -w=/app -ti jdeck88/ontology-data-pipeline \
    python pipeline.py \
    -v --drop_invalid \
    /process/sample/data.csv \
    /process/sample/output \
    https://raw.githubusercontent.com/futres/fovt/597a56be6f481de2c0320db023f0ac0543724880/ontology/fovt-merged-reasoned.owl \
    /process/sample/config \
