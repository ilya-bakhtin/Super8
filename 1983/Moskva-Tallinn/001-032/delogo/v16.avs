SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")
/*
v16_m = v16.PrepareMask(mask_tolerance = 150, mask_w = 140, mask_h = 100)
#return v16_m.prefetch
v16 = v16.convertToRGB32(interlaced=false, matrix="PC.709")
v16 = v16.ExInpaint(mask = v16_m)
v16 = v16.convertToYV24(interlaced=false, matrix="PC.709")
*/
va = BlankClip(v16, audio_rate = 48000, channels = 2).killVideo
v16 = v16.audioDub(va)

last = v16
prefetch

