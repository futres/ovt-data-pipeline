PROJECT=$1
if [ -z $PROJECT ]
   then
     echo "Usage: run_test.sh {project}"
     echo "Current projects are vertnet."
     echo "This bash script runs the pipeline for each of these projects using data in test_data directory" 
     echo "NOTE that this does not actually run the TEST script itself, but is used to run through the pipeline"
     echo "on the test_data... useful for testing the tests"
     exit 0
fi

python ../ontology-data-pipeline/process.py \
    -v --drop_invalid \
    $PROJECT \
    test_data/$PROJECT/input \
    test_data/$PROJECT/output \
    https://raw.githubusercontent.com/futres/ovt/master/ontology/ovt-merged-reasoned.owl \
    config \
    projects \

