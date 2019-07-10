INPUT_DATAFILE=$1
OUTPUT_DIRECTORY=$2

if [[ -z $INPUT_DATAFILE ]] || [[ -z $OUTPUT_DIRECTORY ]]
   then
     echo "Usage: run.sh {DATAFILE} {OUTPUT_DIRECTORY}"
     echo ""
     echo "This bash script runs the pipeline for any INPUT_DATAFILE and places output in the specified OUTPUT_DIRECTORY." 
     exit 0
fi

# check that we have the latest ...
docker pull jdeck88/ontology-data-pipeline

docker run -v "$(pwd)":/process -w=/app -ti jdeck88/ontology-data-pipeline \
    python pipeline.py \
    -v --drop_invalid \
    --data_file $INPUT_DATAFILE \
    $OUTPUT_DIRECTORY \
    https://raw.githubusercontent.com/futres/fovt/master/ontology/fovt-merged-reasoned.owl \
    config \
