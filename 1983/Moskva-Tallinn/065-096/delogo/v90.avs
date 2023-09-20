SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v90 = v90.deScratch(maxwidth=5, mindif=1)

v90_m = v90.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v90 = v90.convertToRGB32(interlaced=false, matrix="PC.709")

v90 = v90.ExInpaint(mask = v90_m)
v90 = v90.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v90, audio_rate = 48000, channels = 2).killVideo
v90 = v90.audioDub(va)

last = v90
prefetch

