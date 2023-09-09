SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v55 = v55.deScratch(maxwidth=5, mindif=1)

v55_m = v55.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v55 = v55.convertToRGB32(interlaced=false, matrix="PC.709")

v55 = v55.ExInpaint(mask = v55_m)
v55 = v55.convertToYV24(interlaced=false)

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

last = v55
prefetch

