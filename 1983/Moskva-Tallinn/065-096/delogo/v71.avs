SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v71 = v71.deScratch(maxwidth=5, mindif=1)

v71_m = v71.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")

v71 = v71.ExInpaint(mask = v71_m)
v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

last = v71
prefetch

