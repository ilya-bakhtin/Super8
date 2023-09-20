SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v74 = v74.deScratch(maxwidth=5, mindif=1)

v74_m = v74.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v74 = v74.convertToRGB32(interlaced=false, matrix="PC.709")

v74 = v74.ExInpaint(mask = v74_m)
v74 = v74.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v74, audio_rate = 48000, channels = 2).killVideo
v74 = v74.audioDub(va)

last = v74
prefetch

