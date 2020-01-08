#!/bin/bash

## Script that uses 'sra-toolkit' to download, md5 checksum and dump to fastq a sra file 
# You should run it like ./download_sra SRR####### to download a single .sra file
# You can also run ./download_sra SRR_list.txt, to download multiple .sra file at once


# Overall checks
# Check if 'sra-toolkit' is installed
prefetch &> /dev/null

if [[ $? -ne 0 ]]; then
    echo "'sra-toolkit' package not installed!"
    exit 1
fi

# Check type of parameter
if [[ -f $1 ]]; then
    cmd="cat"
elif [[ $1 != "" ]]; then
    cmd="echo"
elif [[ -d $1 ]]; then
    echo "$1 is a directory"
    exit 1
elif [[ -z $1 ]]; then
    echo "Missing SRA code parameter"
    exit 1
elif [[ -e $1 ]]; then
    echo "File not found"
    exit 1
fi

# Gets the total amount of cores available
nprocs=$(nproc --all)

nprocs=$(( $nprocs / 4 ))

# Stores date and time in dt variable
dt=$(date '+%Y-%m-%dT%H:%M:%S')

eval "$cmd" $1 | while read line
do
    echo "$dt Fetching $line.sra"
    counter=0
    until prefetch "$line"; do 
        if [[ $counter -eq 5 ]]; then
            echo "Failed to fetch .sra file 5 times in a row... Exiting"
            exit 1
        fi

        echo "Failed to fetch .sra file... Trying again" 
        counter=$(( $counter + 1 ))
    done

    # Store .sra file path
    srapath=$(srapath $line)
    
    echo "$dt Success! $line.sra stored in $srapath"

    echo "$dt md5checksuming $srapath..."
    # md5sum check of .sra file
    vdb-validate "$srapath"

    if [[ $? -ne 0 ]]; then
        echo "Failed to validate $srapath, please try downloading it again"
        exit 1
    fi
    
    echo "$dt Success! $srapath md5checksum is correct!"
    
    echo "$dt Dumping .sra file to ./$line.fastq..."

    # Dump .sra to .fastq format
    fasterq-dump -e $nprocs $srapath

    echo "$dt Success! $line.fastq stored in $( pwd $line.fastq )!"

done

exit 0

