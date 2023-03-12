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

# extract silences > 60 ms
selectObject: obj_id_sound
obj_id_textgrid_silences = To TextGrid (silences): pitch_min, 0, -25, 0.06, 0.06, "silent", "sounding"
selectObject: obj_id_textgrid_silences

# count silences
obj_id_table_silences = Tabulate occurrences: { 1 }, "is equal to", "silent", "no"
selectObject: obj_id_table_silences
num_silences = Get number of rows

# output
writeInfoLine: num_silences
