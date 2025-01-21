DATASETS_PATH="/home/stefano/Data"
DATASET_NAME="hypernerf"
SCENE_NAME="split-cookie"
# DATASET_NAME="d-nerf"
# SCENE_NAME="jumpingjacks"

DATASET_PATH=$DATASETS_PATH/$DATASET_NAME/$SCENE_NAME

RUN_ID=""

# if RUN_ID is not provided, generate new one
if [ -z "$RUN_ID" ]; then
    # NEW RUN_ID: YYYY-MM-DD-HHMMSS
    RUN_ID=$(date +'%Y-%m-%d-%H%M%S')
    echo "RUN_ID: $RUN_ID"
fi

# 
RESULT_DIR=outputs/$DATASET_NAME/$SCENE_NAME/$RUN_ID

# make sure results_dir exists
if [ ! -d "$RESULT_DIR" ]; then
    echo "results directory does not exist, training"
    CUDA_VISIBLE_DEVICES=0 \
    python train.py \
        -s $DATASET_PATH \
        -m $RESULT_DIR \
        --eval \
        --is_6dof \
        --iterations 20000
fi

# --is_blender \

# HyperNeRF
# python train.py -s path/to/your/real-world/dataset -m output/exp-name --eval --iterations 20000

# python render.py -m output/exp-name --mode render
# python metrics.py -m output/exp-name