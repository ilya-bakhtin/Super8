SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v83 = v83.deScratch(maxwidth=5, mindif=1)

v83_m = v83.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v83 = v83.convertToRGB32(interlaced=false, matrix="PC.709")

v83 = v83.ExInpaint(mask = v83_m)
v83 = v83.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v83, audio_rate = 48000, channels = 2).killVideo
v83 = v83.audioDub(va)

last = v83
prefetch

