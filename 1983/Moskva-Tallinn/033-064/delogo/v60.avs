SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v60 = v60.deScratch(maxwidth=5, mindif=1)

v60_m = v60.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v60 = v60.convertToRGB32(interlaced=false, matrix="PC.709")

v60 = v60.ExInpaint(mask = v60_m)
v60 = v60.convertToYV24(interlaced=false)

va = BlankClip(v60, audio_rate = 48000, channels = 2).killVideo
v60 = v60.audioDub(va)

last = v60
prefetch

