# a sample_runner script running python directly, 
# assuming that you have ontology-data-pipeline checkout
    python ../ontology-data-pipeline/process.py \
    -v --drop_invalid \
    sample/data.csv \
    sample/output \
    https://raw.githubusercontent.com/futres/fovt/597a56be6f481de2c0320db023f0ac0543724880/ontology/fovt-merged-reasoned.owl \
    sample/config \
