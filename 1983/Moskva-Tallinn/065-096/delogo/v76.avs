SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v76 = v76.deScratch(maxwidth=5, mindif=1)

v76_m = v76.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v76 = v76.convertToRGB32(interlaced=false, matrix="PC.709")

v76 = v76.ExInpaint(mask = v76_m)
v76 = v76.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

last = v76
prefetch

