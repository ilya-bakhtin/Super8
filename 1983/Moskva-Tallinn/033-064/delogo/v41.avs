SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v41 = v41.deScratch(maxwidth=5, mindif=1)

v41_m = v41.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v41 = v41.convertToRGB32(interlaced=false, matrix="PC.709")

v41 = v41.ExInpaint(mask = v41_m)
v41 = v41.convertToYV24(interlaced=false)

va = BlankClip(v41, audio_rate = 48000, channels = 2).killVideo
v41 = v41.audioDub(va)

last = v41
prefetch

