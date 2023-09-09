SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v62 = v62.deScratch(maxwidth=5, mindif=1)

v62_m = v62.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v62 = v62.convertToRGB32(interlaced=false, matrix="PC.709")

v62 = v62.ExInpaint(mask = v62_m)
v62 = v62.convertToYV24(interlaced=false)

va = BlankClip(v62, audio_rate = 48000, channels = 2).killVideo
v62 = v62.audioDub(va)

last = v62
prefetch

