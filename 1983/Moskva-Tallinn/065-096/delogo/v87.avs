SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v87 = v87.deScratch(maxwidth=5, mindif=1)

v87_m = v87.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v87 = v87.convertToRGB32(interlaced=false, matrix="PC.709")

v87 = v87.ExInpaint(mask = v87_m)
v87 = v87.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

last = v87
prefetch

