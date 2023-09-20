SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v88 = v88.deScratch(maxwidth=5, mindif=1)

v88_m = v88.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v88 = v88.convertToRGB32(interlaced=false, matrix="PC.709")

v88 = v88.ExInpaint(mask = v88_m)
v88 = v88.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v88, audio_rate = 48000, channels = 2).killVideo
v88 = v88.audioDub(va)

last = v88
prefetch

