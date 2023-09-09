SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v43 = v43.deScratch(maxwidth=5, mindif=1)

v43_m = v43.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v43 = v43.convertToRGB32(interlaced=false, matrix="PC.709")

v43 = v43.ExInpaint(mask = v43_m)
v43 = v43.convertToYV24(interlaced=false)

va = BlankClip(v43, audio_rate = 48000, channels = 2).killVideo
v43 = v43.audioDub(va)

last = v43
prefetch

