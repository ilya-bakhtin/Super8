SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v80 = v80.deScratch(maxwidth=5, mindif=1)

v80_m = v80.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v80 = v80.convertToRGB32(interlaced=false, matrix="PC.709")

v80 = v80.ExInpaint(mask = v80_m)
v80 = v80.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v80, audio_rate = 48000, channels = 2).killVideo
v80 = v80.audioDub(va)

last = v80
prefetch

