SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v82 = v82.deScratch(maxwidth=5, mindif=1)

v82_m = v82.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v82 = v82.convertToRGB32(interlaced=false, matrix="PC.709")

v82 = v82.ExInpaint(mask = v82_m)
v82 = v82.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v82, audio_rate = 48000, channels = 2).killVideo
v82 = v82.audioDub(va)

last = v82
prefetch

