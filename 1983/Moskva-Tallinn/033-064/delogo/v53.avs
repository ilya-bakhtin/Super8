SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v53 = v53.deScratch(maxwidth=5, mindif=1)

v53_m = v53.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v53 = v53.convertToRGB32(interlaced=false, matrix="PC.709")
#return v53.interleave(v53_m)
v53 = v53.ExInpaint(mask = v53_m)
v53 = v53.convertToYV24(interlaced=false)

va = BlankClip(v53, audio_rate = 48000, channels = 2).killVideo
v53 = v53.audioDub(va)

last = v53
prefetch

