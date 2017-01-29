#!/bin/bash -e

echo "Started listening on the changes for directory /opt/my-app/data/input"

input_dir="/opt/my-app/data/input";
output_dir="/opt/my-app/data/output";

wait_seconds=10;

if [[ ! -d ${input_dir} ]]; then
    echo "Could not find ${input_dir}, creating the directory"
    mkdir -p ${input_dir};
fi

if [[ ! -d ${output_dir} ]]; then
    echo "Could not find ${output_dir}, creating the directory"
    mkdir -p ${output_dir};
fi

while [[ true ]]; do
    echo "Sleeping for ${wait_seconds} seconds for the next run"
    sleep ${wait_seconds};

    input_files=`ls ${input_dir}`;
    no_of_files=`echo ${input_files} | wc -w`;

    if [[ $no_of_files -gt 0 ]]; then
        for f in $input_files
        do
            echo "Processing file $f";
            mv ${input_dir}/${f} ${output_dir}/${f};
        done
    else
        echo "No new files found for this interval";
    fi
done
