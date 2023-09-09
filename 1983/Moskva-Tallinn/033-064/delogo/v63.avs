SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v63 = v63.deScratch(maxwidth=5, mindif=1)

v63_m = v63.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v63 = v63.convertToRGB32(interlaced=false, matrix="PC.709")

v63 = v63.ExInpaint(mask = v63_m)
v63 = v63.convertToYV24(interlaced=false)

va = BlankClip(v63, audio_rate = 48000, channels = 2).killVideo
v63 = v63.audioDub(va)

last = v63
prefetch

