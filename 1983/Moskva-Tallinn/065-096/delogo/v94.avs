SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v94 = v94.deScratch(maxwidth=5, mindif=1)

v94_m = v94.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v94 = v94.convertToRGB32(interlaced=false, matrix="PC.709")

v94 = v94.ExInpaint(mask = v94_m)
v94 = v94.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v94, audio_rate = 48000, channels = 2).killVideo
v94 = v94.audioDub(va)

last = v94
prefetch

