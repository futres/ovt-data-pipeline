PROJECT=$1
if [ -z $PROJECT ]
   then
     echo "Usage: run.sh {project}"
     echo "Current project is vertnet"
     echo "This bash script runs the pipeline for each of these projects"
     exit 0
fi

python ../ontology-data-pipeline/process.py \
    -v --drop_invalid \
    $PROJECT \
    data/$PROJECT/input/ \
    data/$PROJECT/output/ \
    https://raw.githubusercontent.com/futres/ovt/master/ontology/ovt-merged-reasoned.owl \
    config/ \
    projects/ \
#file:/Users/jdeck/IdeaProjects/ovt/ontology/ovt-merged-reasoned.owl \
