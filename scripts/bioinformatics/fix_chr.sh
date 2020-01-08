#!/bin/bash


IFS='.' read -ra input_array <<< "$1"

OUTPUT=${input_array[0]}
FILETYPE=${input_array[1]}

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

last_line=$(tail -n 1 $1)

chr=${last_line:0:3}

if [[ $chr == "chr" ]];
then
    # Change chr# to #
    awk '{gsub(/^chr/,""); print}' $1 > "$OUTPUT"_nochr."$FILETYPE"
else
    # Change # to chr#
    awk '{
            if($0 !~ /^#/)
                print "chr"$0;
            else if(match($0,/(##contig=<ID=)(.*)/,m))
                print m[1]"chr"m[2];
            else print $0
          }' $1 > "$OUTPUT"_chr."$FILETYPE"
fi
