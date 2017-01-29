#!/bin/bash -e

echo "Up and running to generate a 4K-size random file";

output_dir="/opt/my-app/data";
output_file="random-4K.bin";

if [[ ! -d ${output_dir} ]]; then
    echo "Could not find ${output_dir}, creating the directory";
    mkdir -p ${output_dir};
fi

echo "Outputing the file to ${output_dir}/${output_file}";
dd if=/dev/urandom of=${output_dir}/${output_file} bs=512 count=8;

exit 0;
