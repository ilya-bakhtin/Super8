SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v47 = v47.deScratch(maxwidth=5, mindif=1)

v47_m = v47.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v47 = v47.convertToRGB32(interlaced=false, matrix="PC.709")

v47 = v47.ExInpaint(mask = v47_m)
v47 = v47.convertToYV24(interlaced=false)

va = BlankClip(v47, audio_rate = 48000, channels = 2).killVideo
v47 = v47.audioDub(va)

last = v47
prefetch

