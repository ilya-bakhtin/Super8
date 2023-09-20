SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v78 = v78.deScratch(maxwidth=5, mindif=1)

v78_m = v78.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v78 = v78.convertToRGB32(interlaced=false, matrix="PC.709")

v78 = v78.ExInpaint(mask = v78_m)
v78 = v78.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v78, audio_rate = 48000, channels = 2).killVideo
v78 = v78.audioDub(va)

last = v78
prefetch

