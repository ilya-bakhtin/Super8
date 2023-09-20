SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v75 = v75.deScratch(maxwidth=5, mindif=1)

v75_m = v75.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v75 = v75.convertToRGB32(interlaced=false, matrix="PC.709")

v75 = v75.ExInpaint(mask = v75_m)
v75 = v75.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v75, audio_rate = 48000, channels = 2).killVideo
v75 = v75.audioDub(va)

last = v75
prefetch

