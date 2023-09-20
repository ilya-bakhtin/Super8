SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v84 = v84.deScratch(maxwidth=5, mindif=1)

v84_m = v84.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v84 = v84.convertToRGB32(interlaced=false, matrix="PC.709")

v84 = v84.ExInpaint(mask = v84_m)
v84 = v84.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

last = v84
prefetch

