# awk script that separates fasta (or any variant) file according to a
# substring in its header text.

# It will create in the same directory of execution a folder with the target
# substring (e.g. plasmid) and then put the sequences inside this folder,
# adding a suffix to the filename referring to the substring.

# Use e.g.
# /Chr22/ {
#     target="Chr22"
#     split_filename=split(FILENAME, a, ".f")
#     system("mkdir -p "target)
#     OUT=target"/" a[1] "_"target".fna"
#
#     printf ">"$0 > OUT
# }

BEGIN {
    RS=">"
} 

/plasmid/ {
    target="plasmid"
    split_filename=split(FILENAME, a, ".f") 
    system("mkdir -p "target)
    OUT=target"/" a[1] "_"target".fna"

    printf ">"$0 > OUT
}

/chromosome/ {
    target="chromosome"
    split_filename=split(FILENAME, a, ".f") 
    system("mkdir -p "target)
    OUT=target"/" a[1] "_"target".fna"

    printf ">"$0 > OUT
}
