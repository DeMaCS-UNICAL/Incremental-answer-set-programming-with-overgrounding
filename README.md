# Incremental answer set programming with overgrounding
Knowledge Representation; Answer Set Programming; Grounding Logic Programs

## I-DLV Incremental - Standalone version
The `idlv-incremental` folder provides a standalone executable of I-DLV Incremental. 
There is no need to install any library.
Just extract the compressed file to a known location on your computer, and from that location type `./idlv`

## How to increase/decrease Pac-Man horizon limit
The `updateDistance.sh` script can be used to update the `size` parameter that limits the maximum visibility horizon of
the Pac-Man.
The script must be executed in the following way: 
`sh updateDistance.sh old_size new_size`
By default, `old_size` is set to *30*

## How to run the I-DLV Incremental on Pac-Man encodings
Open a bash in the `idlv-incremental` folder and execute the command `./idlv --check-edb-duplication --output=7 --no-simplify < pacman.xml`. The output of the grounder will be store in the `groundPacman` folder (create this folder if it does not exist).

## Benchmarks
Please, refer to our wiki page for further experiments and benchmark - [wiki page](https://github.com/DeMaCS-UNICAL/Incremental-answer-set-programming-with-overgrounding/wiki)
