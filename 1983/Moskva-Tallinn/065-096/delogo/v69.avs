SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v69 = v69.deScratch(maxwidth=5, mindif=1)

v69_m = v69.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v69 = v69.convertToRGB32(interlaced=false, matrix="PC.709")

v69 = v69.ExInpaint(mask = v69_m)
v69 = v69.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

last = v69
prefetch

