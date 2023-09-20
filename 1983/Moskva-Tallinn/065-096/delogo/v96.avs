SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v96 = v96.deScratch(maxwidth=5, mindif=1)

v96_m = v96.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v96 = v96.convertToRGB32(interlaced=false, matrix="PC.709")

v96 = v96.ExInpaint(mask = v96_m)
v96 = v96.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v96, audio_rate = 48000, channels = 2).killVideo
v96 = v96.audioDub(va)

last = v96
prefetch

