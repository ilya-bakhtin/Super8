SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v58 = v58.deScratch(maxwidth=5, mindif=1)

v58_m = v58.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v58 = v58.convertToRGB32(interlaced=false, matrix="PC.709")

v58 = v58.ExInpaint(mask = v58_m)
v58 = v58.convertToYV24(interlaced=false)

va = BlankClip(v58, audio_rate = 48000, channels = 2).killVideo
v58 = v58.audioDub(va)

last = v58
prefetch

