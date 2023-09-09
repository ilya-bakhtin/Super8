SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v50 = v50.deScratch(maxwidth=5, mindif=1)

v50_m = v50.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v50 = v50.convertToRGB32(interlaced=false, matrix="PC.709")

v50 = v50.ExInpaint(mask = v50_m)
v50 = v50.convertToYV24(interlaced=false)

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

last = v50
prefetch

