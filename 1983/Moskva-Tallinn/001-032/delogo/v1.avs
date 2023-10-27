SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")
/*
v1_m = v1.PrepareMask(mask_tolerance = 200, mask_w = 160, mask_h = 110)

v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")
v1 = v1.ExInpaint(mask = v1_m)
v1 = v1.convertToYV24(interlaced=false, matrix="PC.709")
*/
va = BlankClip(v1, audio_rate = 48000, channels = 2).killVideo
v1 = v1.audioDub(va)

last = v1
prefetch

