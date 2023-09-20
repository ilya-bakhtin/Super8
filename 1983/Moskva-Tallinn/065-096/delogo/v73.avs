SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v73 = v73.deScratch(maxwidth=5, mindif=1)

v73_m = v73.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v73 = v73.convertToRGB32(interlaced=false, matrix="PC.709")

v73 = v73.ExInpaint(mask = v73_m)
v73 = v73.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

last = v73
prefetch

