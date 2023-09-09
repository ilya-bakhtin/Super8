SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v34 = v34.deScratch(maxwidth=5, mindif=1)

v34_m = v34.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v34 = v34.convertToRGB32(interlaced=false, matrix="PC.709")

v34 = v34.ExInpaint(mask = v34_m)
v34 = v34.convertToYV24(interlaced=false)

va = BlankClip(v34, audio_rate = 48000, channels = 2).killVideo
v34 = v34.audioDub(va)

last = v34
prefetch

