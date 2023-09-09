SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v33 = v33.deScratch(maxwidth=5, mindif=1)

v33_m = v33.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v33 = v33.convertToRGB32(interlaced=false, matrix="PC.709")

v33 = v33.ExInpaint(mask = v33_m)
#return v33.interleave(v33_m).prefetch
v33 = v33.convertToYV24(interlaced=false)

va = BlankClip(v33, audio_rate = 48000, channels = 2).killVideo
v33 = v33.audioDub(va)

last = v33
prefetch

