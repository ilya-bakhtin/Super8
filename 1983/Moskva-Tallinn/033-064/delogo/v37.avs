SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v37 = v37.deScratch(maxwidth=5, mindif=1)

v37_m = v37.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v37 = v37.convertToRGB32(interlaced=false, matrix="PC.709")

v37 = v37.ExInpaint(mask = v37_m)
v37 = v37.convertToYV24(interlaced=false)

va = BlankClip(v37, audio_rate = 48000, channels = 2).killVideo
v37 = v37.audioDub(va)

last = v37
prefetch

