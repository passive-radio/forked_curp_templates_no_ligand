# Create amber input files

In this directory, I created amber input files(system.crd and system.prmtop) from Gaussian output and 2PR5 pdb data.

You can reproduce my works following process:

1. Use H++ server
   1. Download `0.15_80_10_pH7.0_2pr5.pqr.from_ambpdb` as `input/protein.pdb`
2. Run `create_amber_input.sh`
3. Run `parmed -p output/system.dry.prmtop -c output/system.dry.crd -i input/parmed.input --no-splash > log/summary_of_system_dry.log` to check the mass of system + ligand
4. Check the number of Ions using [SLTCAP](https://www.phys.ksu.edu/personal/schmit/SLTCAP/SLTCAP.html)
5. Change ion number
6. Run `create_amber_input.sh` again
7. Run `md5sum output/* > checksum` in `0structure` directory
8. To calculate side chain heat conductivity, we want atomgroup file. Run `create_atomgroup_sidechain.sh`
9. Re-run `md5sum output/* > checksum` in `0structure` directory


## Directory and files

- `create_amber_input.sh` is the script to do all you have to do in this step. 
- `log/` hold logs that record proceess in `create_amber_input.sh`
- `input/` hold input files of `create_amber_input.sh`
- `output/` hold output files of `create_amber_input.sh`.

## Requirements

- PDB file
  - Modify original PDB file using H++ server
    - pH = 7.0 

## Outputs

- system.dry.pdb
- system.dry.crd
- system.dry.prmtop
- system.pdb
- system.crd
- system.prmtop

These files are created by saveAmberParam in tleap. `system.crd` is initial *input coordinates* of the system. `system.prmtop` records system *topology and parameters*. These files are also known as `inpcrd` and `prmtop`, respectively.

You can check details how these files are created at `input/leapin` file.

- leap.log

This is another log of tleap. I think readability of this file is not better than `log/leap_stdout.log`.

## Next step

1minimization is the next step. The step use

- `$prefix/0structure/output/system.prmtop`
- `$prefix/0structure/output/system.crd`
