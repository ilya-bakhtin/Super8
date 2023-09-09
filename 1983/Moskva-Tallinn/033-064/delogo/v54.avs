SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v54 = v54.deScratch(maxwidth=5, mindif=1)

v54_m = v54.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v54 = v54.convertToRGB32(interlaced=false, matrix="PC.709")

v54 = v54.ExInpaint(mask = v54_m)
v54 = v54.convertToYV24(interlaced=false)

va = BlankClip(v54, audio_rate = 48000, channels = 2).killVideo
v54 = v54.audioDub(va)

last = v54
prefetch

