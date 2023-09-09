SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v59 = v59.deScratch(maxwidth=5, mindif=1)

v59_m = v59.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v59 = v59.convertToRGB32(interlaced=false, matrix="PC.709")

v59 = v59.ExInpaint(mask = v59_m)
v59 = v59.convertToYV24(interlaced=false)

va = BlankClip(v59, audio_rate = 48000, channels = 2).killVideo
v59 = v59.audioDub(va)

last = v59
prefetch

