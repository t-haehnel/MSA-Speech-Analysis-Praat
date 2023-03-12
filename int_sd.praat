form
   text soundfile
   text textgridfile
   integer voicing_only
   integer pitch_min
   real padding_perc_start
   real padding_perc_end
endform

# load wav + textgrid
obj_id_sound = Read from file: soundfile$
obj_id_textgrid = Read from file: textgridfile$

# extract voice part
selectObject: obj_id_sound
plusObject: obj_id_textgrid
Extract intervals where: 1, "no", "is equal to", "voice"
obj_id_sound = Concatenate

# remove padding (if <> 0)
selectObject: obj_id_sound
if padding_perc_start > 0 or padding_perc_end > 0
    duration = Get total duration
    analyze_begin = duration * padding_perc_start
    analyze_end = duration - (duration * padding_perc_end)
    obj_id_sound = Extract part: analyze_begin, analyze_end, "rectangular", 1, "no"
endif

# extract voicing only segments (for text reading only, not for sustained phonation)
if voicing_only = 1
    selectObject: obj_id_sound
    obj_id_textgrid_silences = To TextGrid (silences): pitch_min, 0, -25, 0.06, 0.06, "silent", "sounding"
    selectObject: obj_id_sound
    plusObject: obj_id_textgrid_silences
    Extract intervals where: 1, "no", "is equal to", "sounding"
    obj_id_sound = Concatenate
endif

# calculate
selectObject: obj_id_sound
To Intensity: pitch_min, 0, "yes"
int_sd = Get standard deviation: 0, 0

# output
writeInfoLine: int_sd
