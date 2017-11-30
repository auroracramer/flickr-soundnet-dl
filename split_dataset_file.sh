#!/usr/bin/env bash

DATASET_PATH=$1
NUM_SPLIT=$2

if [ "$NUM_SPLIT" != "" ]; then
    # Figure out (max) number of lines per file
    TOTAL_NUM_LINES=$(cat $DATASET_PATH | wc -l);
    LINES_PER_FILE=$(( ($TOTAL_NUM_LINES + $NUM_SPLIT - 1) / $NUM_SPLIT ));

    # Split the dataset file into roughly equal sized files. Each will have a
    # numeric prefix '.<num>' with a leading zero if necessary.
    split --lines=$LINES_PER_FILE --numeric-suffixes=1 $DATASET_PATH "${DATASET_PATH}.";
fi

exit 0;
