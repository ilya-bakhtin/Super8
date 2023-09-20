SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v92 = v92.deScratch(maxwidth=5, mindif=1)

v92_m = v92.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v92 = v92.convertToRGB32(interlaced=false, matrix="PC.709")

v92 = v92.ExInpaint(mask = v92_m)
v92 = v92.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v92, audio_rate = 48000, channels = 2).killVideo
v92 = v92.audioDub(va)

last = v92
prefetch

