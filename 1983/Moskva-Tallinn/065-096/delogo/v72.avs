SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v72 = v72.deScratch(maxwidth=5, mindif=1)

v72_m = v72.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v72 = v72.convertToRGB32(interlaced=false, matrix="PC.709")

v72 = v72.ExInpaint(mask = v72_m)
v72 = v72.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v72, audio_rate = 48000, channels = 2).killVideo
v72 = v72.audioDub(va)

last = v72
prefetch

