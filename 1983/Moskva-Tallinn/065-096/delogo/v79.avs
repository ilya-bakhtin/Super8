SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v79 = v79.deScratch(maxwidth=5, mindif=1)

v79_m = v79.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")

v79 = v79.ExInpaint(mask = v79_m)
v79 = v79.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

last = v79
prefetch

