SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v68 = v68.deScratch(maxwidth=5, mindif=1)

v68_m = v68.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v68 = v68.convertToRGB32(interlaced=false, matrix="PC.709")

v68 = v68.ExInpaint(mask = v68_m)
v68 = v68.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

last = v68
prefetch

