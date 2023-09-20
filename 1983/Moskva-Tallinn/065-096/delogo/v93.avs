SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v93 = v93.deScratch(maxwidth=5, mindif=1)

v93_m = v93.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v93 = v93.convertToRGB32(interlaced=false, matrix="PC.709")

v93 = v93.ExInpaint(mask = v93_m)
v93 = v93.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v93, audio_rate = 48000, channels = 2).killVideo
v93 = v93.audioDub(va)

last = v93
prefetch

