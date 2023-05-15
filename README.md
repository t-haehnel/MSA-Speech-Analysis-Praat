# MSA and PD Speech Analysis

Praat scripts for MSA and PD speech analysis.

This Github repository contains code of the publication **XXXX**. Please refer to this publication for further details.

When using this software, please cite the work as: **XXXX**

## Usage

Praat scripts can be called from command line by passing the name of the .wav soundfile, textgrid annotation file and required parameters. Details regarding the parameters are explained in the file parameters.ods.

In general, we used sex-specific settings for pitch and formants:
**male:**
* minimum pitch: 60 Hz
* maximum pitch: 300 Hz
* formant ceiling: 4000 Hz

**female:**
* minimum pitch: 100 Hz
* maximum pitch: 500 Hz
* formant ceiling: 6000 Hz

The following parameters were used for **both** female and male:
* number of formants: 4
* formant window: 0.04 s
* minimum silence time for pause detection: 60 ms

All results should be checked by visual inspection in Praat and default parameters should be adjusted if required.

All scripts require a .textgrid together with the soundfile. The textgrid file needs to contain an interval tier at first position with the speech of the patient annotated as 'voice'. 
Additionally, f1.praat and f2.praat require another interval tier at second position containing one interval 'formant' which will be used for f1/f2 calculations.

We provide two sound files as examples (sample_reading.wav, sample_sustainedphonation.wav) from healthy controls with corresponding textgrid annotations (sample_reading.TextGrid, sample_sustainedphonation.textGrid). The speech characteristics can be obtained from the commands shown below. Please note that the example recordings are from a male person, thus we use the male default parameters. For recordings of female people, this parameters needs to be adjusted accordingly. Also note, that these example recordings were obtained using a smartphone microphone. For scientific use, a more precise microfone should be used. Moreover, the reading text *Nordwind und Sonne* had been shortened for this recording.

### Voice characteristics calculation for sustained phonation task

#### F0 variability
```bash
praat stsd.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 0 60 300 0.1 0.1
```

#### Formant F1/F2 calculation:
```bash
praat f1.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 4000 4 0.04
```

```bash
praat f2.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 4000 4 0.04
```

#### Harmonics to noise ratio calculation:
```bash
praat hnr.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 60 0.1 0.1
```

#### Intensity variability
```bash
praat int_sd.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 0 60 0.1 0.1
```

#### Jitter
```bash
praat jitter.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 60 300 0.1 0.1
```

#### Shimmer
```bash
praat shimmer.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 60 300 0.1 0.1
```

#### Voice breaks
```bash
praat voicebreaks.praat sample_sustainedphonation.wav sample_sustainedphonation.TextGrid 60 300 0.1 0.1
```

### Voice characteristics calculation for reading task

##### Intensity variability (reading task)
```bash
praat int_sd.praat sample_reading.wav sample_reading.TextGrid 1 60 0 0
```

#### Pause duration
```bash
praat pauseduration.praat sample_reading.wav sample_reading.TextGrid 60
```

#### Pause number
```bash
praat pauseduration.praat sample_reading.wav sample_reading.TextGrid 60
```

#### F0 variability
```bash
praat stsd.praat sample_reading.wav sample_reading.TextGrid 1 60 300 0 0
```
