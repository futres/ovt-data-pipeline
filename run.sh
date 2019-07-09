DATAFILE=ray.txt
if [ -z $DATAFILE ]
   then
     echo "Usage: run.sh {data_file}"
     echo "This bash script runs the pipeline for each of these projects using data in test_data directory" 
     echo "NOTE that this does not actually run the TEST script itself, but is used to run through the pipeline"
     echo "on the test_data... useful for testing the tests"
     exit 0
fi

# check that we have the latest ...
docker pull jdeck88/ontology-data-pipeline

docker run -v "$(pwd)":/process -w=/app -ti jdeck88/ontology-data-pipeline \
    python pipeline.py \
    --data_file /process/data/$DATAFILE \
    -v --drop_invalid \
    template \
    /process/data/template/input \
    /process/data/template/output \
    https://raw.githubusercontent.com/futres/fovt/master/ontology/fovt-merged-reasoned.owl \
    /process/config \
    /process/projects \
