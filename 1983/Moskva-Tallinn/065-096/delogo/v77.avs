SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v77 = v77.deScratch(maxwidth=5, mindif=1)

v77_m = v77.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v77 = v77.convertToRGB32(interlaced=false, matrix="PC.709")

v77 = v77.ExInpaint(mask = v77_m)
v77 = v77.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

last = v77
prefetch

