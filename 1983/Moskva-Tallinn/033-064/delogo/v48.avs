SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v48 = v48.deScratch(maxwidth=5, mindif=1)

v48_m = v48.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v48 = v48.convertToRGB32(interlaced=false, matrix="PC.709")

v48 = v48.ExInpaint(mask = v48_m)
v48 = v48.convertToYV24(interlaced=false)

va = BlankClip(v48, audio_rate = 48000, channels = 2).killVideo
v48 = v48.audioDub(va)

last = v48
prefetch

