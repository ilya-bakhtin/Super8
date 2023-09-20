SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v95 = v95.deScratch(maxwidth=5, mindif=1)

v95_m = v95.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v95 = v95.convertToRGB32(interlaced=false, matrix="PC.709")

v95 = v95.ExInpaint(mask = v95_m)
v95 = v95.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v95, audio_rate = 48000, channels = 2).killVideo
v95 = v95.audioDub(va)

last = v95
prefetch

