echo "This bash script initiates a test run of the pipeline."

# check that we have the latest ...
docker pull jdeck88/ontology-data-pipeline

docker run -v "$(pwd)":/process -w=/app -ti jdeck88/ontology-data-pipeline \
    python pipeline.py \
    -v --drop_invalid \
    --project vertnet \
    --input_dir /process/test_data/vertnet/input \
    --project_base /process/test_data/projects \
    /process/test_data/vertnet/output \
    https://raw.githubusercontent.com/futres/ovt/master/ontology/ovt-merged-reasoned.owl \
    /process/test_data/config \
