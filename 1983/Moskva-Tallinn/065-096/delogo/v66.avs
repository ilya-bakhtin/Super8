SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v66 = v66.deScratch(maxwidth=5, mindif=1)

v66_m = v66.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")

v66 = v66.ExInpaint(mask = v66_m)
v66 = v66.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v66, audio_rate = 48000, channels = 2).killVideo
v66 = v66.audioDub(va)

last = v66
prefetch

