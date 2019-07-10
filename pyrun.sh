#DATAFILE=data/ray/input/ray_data.csv
#OUTPUTDIRECTORY=data/ray/output
INPUT_DATAFILE=$1
OUTPUT_DIRECTORY=$2

if [[ -z $INPUT_DATAFILE ]] || [[ -z $OUTPUT_DIRECTORY ]]
   then
     echo "Usage: pyrun.sh {DATAFILE} {OUTPUT_DIRECTORY}"
     echo ""
     echo "This bash script runs the pipeline for any INPUT_DATAFILE and places output in the specified OUTPUT_DIRECTORY." 
     echo "It executes the PYTHON code for ontology-data-pipeline and should only be run if you have the ontology-data-pipeline"
     echo "running and installed on your computer, and not on docker"
     exit 0
fi

python ../ontology-data-pipeline/pipeline.py \
-v --drop_invalid \
--data_file $INPUT_DATAFILE \
$OUTPUT_DIRECTORY \
https://raw.githubusercontent.com/futres/fovt/master/ontology/fovt-merged-reasoned.owl \
config \
