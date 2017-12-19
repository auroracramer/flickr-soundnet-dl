#!/usr/bin/env bash

#SBATCH --job-name=flickr-soundnet-dl-array
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16GB
#SBATCH --time=7-0
#SBATCH --mail-type=ALL
#SBATCH --mail-user=name@domain.com
#SBATCH --output="flickr-soundnet-dl-%A-%a.out"
#SBATCH --err="flickr-soundnet-dl-%A-%a.err"

SRCDIR=$HOME/dev/flickr-soundnet-dl
FFMPEG_DIR=$HOME/audiosetdl/bin/ffmpeg
FFMPEG_PATH=$FFMPEG_DIR/ffmpeg
FFPROBE_PATH=$FFMPEG_DIR/ffprobe
DATADIR=/beegfs/work/Flickr

module purge

source $HOME/audiosetdl/bin/miniconda/bin/activate

DATASET_PATH="$DATADIR/txt/urls_public.txt.$(printf '%02d' $SLURM_ARRAY_TASK_ID)";

PATH=$PATH:$FFMPEG_DIR python $SRCDIR/flickr.py \
    -f $FFMPEG_PATH \
    -fp $FFPROBE_PATH \
    --audio-codec flac \
    --audio-format flac \
    --audio-sample-rate 48000 \
    --audio-bit-depth 16 \
    --video-codec h264 \
    --video-format mp4 \
    --video-frame-rate 30 \
    --num-workers 8 \
    --num-retries 20 \
    --no-logging \
    --verbose \
    $DATASET_PATH \
    $DATADIR
