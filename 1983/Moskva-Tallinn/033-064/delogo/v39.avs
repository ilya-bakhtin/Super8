SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v39 = v39.deScratch(maxwidth=5, mindif=1)

v39_m = v39.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v39 = v39.convertToRGB32(interlaced=false, matrix="PC.709")

v39 = v39.ExInpaint(mask = v39_m)
v39 = v39.convertToYV24(interlaced=false)

va = BlankClip(v39, audio_rate = 48000, channels = 2).killVideo
v39 = v39.audioDub(va)

last = v39
prefetch

