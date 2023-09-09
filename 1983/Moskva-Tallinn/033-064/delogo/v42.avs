SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v42 = v42.deScratch(maxwidth=5, mindif=1)

v42_m = v42.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v42 = v42.convertToRGB32(interlaced=false, matrix="PC.709")

v42 = v42.ExInpaint(mask = v42_m)
v42 = v42.convertToYV24(interlaced=false)

va = BlankClip(v42, audio_rate = 48000, channels = 2).killVideo
v42 = v42.audioDub(va)

last = v42
prefetch

