#!/bin/bash

if [[ $# == 1 ]]; then

#   for pop in $(cat pop.list); do shuf -n50 ../../samples/${pop}.ids; done > wthinned.txt

   p="${1}"
  
   # Generate parameter files  
   ./make_par_files.sh ${p}

   # Convert files into eigensoft compartible formats  
   #convertf -p par.PED.PACKEDPED   # ped to packedped
   #convertf -p par.PACKEDPED.PACKEDANCESTRYMAP     # packedped to packedancestrymap
   #convertf -p par.PACKEDANCESTRYMAP.ANCESTRYMAP   # packedancestrymap to ancestrymap
   #convertf -p par.ANCESTRYMAP.EIGENSTRAT  # ancestrymap to eigenstrat

   else 
       echo """
  	Usage:./prepWorldpops.sh <pedprefix>

     pedprefix: Plink ped file prefix NB: Specify path
      Examples:
               for world.ped + world.map                   : world
               for CONVERTF/cam.ped + CONVERTF/cam.map     : CONVERTF/cam
   """
fi
