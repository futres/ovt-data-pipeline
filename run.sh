DATAFILE=ray.txt
DIRECTORY=ray
#if [ -z $DATAFILE ]
#   then
     echo "Usage: run.sh {DATAFILE} {DIRECTORY}"
     echo "This bash script runs the pipeline for the template project." 
     echo "it asks for a single parameter, DATAFILE, which is the name of a data file stored in the input directory"
     echo "NOTE that this does not actually run the TEST script itself, but is used to run through the pipeline"
     echo "on the test_data... useful for testing the tests"
#     exit 0
#fi

# check that we have the latest ...
docker pull jdeck88/ontology-data-pipeline

docker run -v "$(pwd)":/process -w=/app -ti jdeck88/ontology-data-pipeline \
    python pipeline.py \
    --data_file /process/data/$DIRECTORY/$DATAFILE \
    -v --drop_invalid \
    template \
    /process/data/$DIRECTORY/input \
    /process/data/$DIRECTORY/output \
    https://raw.githubusercontent.com/futres/fovt/master/ontology/fovt-merged-reasoned.owl \
    /process/config \
    /process/projects \
