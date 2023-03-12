# MSA Speech Analysis

Praat scripts for MSA speech analysis.

This Github repository contains the code of the publication **XXXX**. Please refer to this publication for further details.

When using this software, please cite the work as: **XXXX**

## Usage

Praat scripts can be called from command line by passing the name of the .wav soundfile, textgrid file and default parameters. Details regarding the parameters required for each script are explained in the file parameters.ods.

All results should be checked by visual inspection in Praat and default parameters should be adjusted if required.

All scripts require a .textgrid together with the soundfile. The textgrid file needs to contain an interval tier at first position with the speech of the patient annotated as 'voice'. 
Additionally, f1.praat and f2.praat require another interval tier at second position containing one interval 'formant' which will be used for f1/f2 calculations.
