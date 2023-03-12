form
   text soundfile
   text textgridfile
   integer pitch_min
endform

# load wav + textgrid
obj_id_sound = Read from file: soundfile$
obj_id_textgrid = Read from file: textgridfile$

# extract voice part
selectObject: obj_id_sound
plusObject: obj_id_textgrid
Extract intervals where: 1, "no", "is equal to", "voice"
obj_id_sound = Concatenate

# calculation
selectObject: obj_id_sound
obj_id_silence = To TextGrid (silences): pitch_min, 0, -25, 0.06, 0.06, "silent", "sounding"

selectObject: obj_id_sound
plusObject: obj_id_silence
Extract intervals where: 1, "no", "is equal to", "silent"
Concatenate
pauseduration = Get total duration

# output
writeInfoLine: pauseduration
