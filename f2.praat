form
   text soundfile
   text textgridfile
   positive formantceiling
   integer formantnumber
   positive formantwindow
endform

# load wav + textgrid
obj_id_sound = Read from file: soundfile$
obj_id_textgrid = Read from file: textgridfile$

# extract formant window from textgrid
selectObject: obj_id_sound
plusObject: obj_id_textgrid
obj_id_sound = Extract intervals where: 2, "no", "is equal to", "formant"

# calculate
selectObject: obj_id_sound
To Formant (burg): 0, formantnumber, formantceiling, formantwindow, 50
f2mean = Get mean: 2, 0, 0, "hertz"

# output
writeInfoLine: f2mean