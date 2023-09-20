SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v86 = v86.deScratch(maxwidth=5, mindif=1)

v86_m = v86.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v86 = v86.convertToRGB32(interlaced=false, matrix="PC.709")

v86 = v86.ExInpaint(mask = v86_m)
v86 = v86.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

last = v86
prefetch

