SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v91 = v91.deScratch(maxwidth=5, mindif=1)

v91_m = v91.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v91 = v91.convertToRGB32(interlaced=false, matrix="PC.709")

v91 = v91.ExInpaint(mask = v91_m)
v91 = v91.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v91, audio_rate = 48000, channels = 2).killVideo
v91 = v91.audioDub(va)

last = v91
prefetch

