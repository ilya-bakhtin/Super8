SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v40 = v40.deScratch(maxwidth=5, mindif=1)

v40_m = v40.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v40 = v40.convertToRGB32(interlaced=false, matrix="PC.709")

v40 = v40.ExInpaint(mask = v40_m)
v40 = v40.convertToYV24(interlaced=false)

va = BlankClip(v40, audio_rate = 48000, channels = 2).killVideo
v40 = v40.audioDub(va)

last = v40
prefetch

