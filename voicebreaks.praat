form
   text soundfile
   text textgridfile
   integer pitch_min
   integer pitch_max
   real padding_perc_start
   real padding_perc_end
endform

# load wav
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

# calculate
selectObject: obj_id_sound
obj_id_pitch = To Pitch: 0, pitch_min, pitch_max

selectObject: obj_id_sound
plusObject: obj_id_pitch
obj_id_pp = To PointProcess (cc)

selectObject: obj_id_pp
plusObject: obj_id_sound
plusObject: obj_id_pitch

obj_id_vr$ = Voice report: 0, 0, pitch_min, pitch_max, 1.3, 1.6, 0.03, 0.45
pitchbreaks = extractNumber(obj_id_vr$, "Degree of voice breaks: ")

# output
writeInfoLine: pitchbreaks
