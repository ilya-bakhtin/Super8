SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v61 = v61.deScratch(maxwidth=5, mindif=1)

v61_m = v61.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v61 = v61.convertToRGB32(interlaced=false, matrix="PC.709")

v61 = v61.ExInpaint(mask = v61_m)
v61 = v61.convertToYV24(interlaced=false)

va = BlankClip(v61, audio_rate = 48000, channels = 2).killVideo
v61 = v61.audioDub(va)

last = v61
prefetch

