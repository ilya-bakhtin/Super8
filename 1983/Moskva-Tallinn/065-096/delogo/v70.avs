SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v70 = v70.deScratch(maxwidth=5, mindif=1)

v70_m = v70.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v70 = v70.convertToRGB32(interlaced=false, matrix="PC.709")

v70 = v70.ExInpaint(mask = v70_m)
v70 = v70.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

last = v70
prefetch

