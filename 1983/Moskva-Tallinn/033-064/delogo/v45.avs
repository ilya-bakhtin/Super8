SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v45 = v45.deScratch(maxwidth=5, mindif=1)

v45_m = v45.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v45 = v45.convertToRGB32(interlaced=false, matrix="PC.709")

v45 = v45.ExInpaint(mask = v45_m)
v45 = v45.convertToYV24(interlaced=false)

va = BlankClip(v45, audio_rate = 48000, channels = 2).killVideo
v45 = v45.audioDub(va)

last = v45
prefetch

