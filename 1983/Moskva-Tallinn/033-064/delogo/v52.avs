SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v52 = v52.deScratch(maxwidth=5, mindif=1)

v52_m = v52.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v52 = v52.convertToRGB32(interlaced=false, matrix="PC.709")

v52 = v52.ExInpaint(mask = v52_m)
v52 = v52.convertToYV24(interlaced=false)

va = BlankClip(v52, audio_rate = 48000, channels = 2).killVideo
v52 = v52.audioDub(va)

last = v52
prefetch

