#!/bin/bash
## Script that separate reads that are concatenated in the same .fastq file
### The usage is ./separate_reads.sh <concatenated.fastq>, and it gives as output
### two files, concatenated_1.fastq with the right reads and concatenated_2.fastq with the left reads

### The command line that does most of the job was get from https://www.biostars.org/p/19446/ post

OUTPUT=
while [[ $# -gt 0 ]]
do
arg="$1"
	case "$arg" in 
		-o|--output) 
		  if [ "$2" ];
	          then 
		     OUTPUT="$2"
	             shift 2
 	  	  else
		     printf "ERROR: -o option requirers a non-empty argument.\n" "$1" >&2
		     exit 1
		  fi
		;;

		--) # End of all options
		  shift
		  break	
		;;
		
		-?*)
		  printf "WARN: Unknown option: $1\n" "$1" >&2
	          shift
		;;
		
		*) # Default case: No more options so break out of the loop
		  break
	esac
done

dt=$(date '+%Y-%m-%d %H:%M:%S')
echo "$dt Splitting $1"

# Splits input file in two, separating <input.fastq> to <input> and <fastq>
IFS='.' read -ra input_array <<< "$1"

if [ -z "$OUTPUT" ] 
then
	OUTPUT=${input_array[0]}
fi

echo "$dt Writing "$OUTPUT"_1.fastq.."
# Right read
awk 'NR%2==1 { print $0 "/1" } ; NR%2==0 { print substr($0,0,length($0)/2) }' $1 > ""$OUTPUT"_1.fastq"

echo "$dt Writing "$OUTPUT"_2.fastq.."
# Left read
awk 'NR%2==1 { print $0 "/2" } ; NR%2==0 { print substr($0,length($0)/2+1) }' $1 > ""$OUTPUT"_2.fastq"

