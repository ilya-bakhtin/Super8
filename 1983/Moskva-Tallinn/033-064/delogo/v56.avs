SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v56 = v56.deScratch(maxwidth=5, mindif=1)

v56_m = v56.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v56 = v56.convertToRGB32(interlaced=false, matrix="PC.709")

v56 = v56.ExInpaint(mask = v56_m)
v56 = v56.convertToYV24(interlaced=false)

va = BlankClip(v56, audio_rate = 48000, channels = 2).killVideo
v56 = v56.audioDub(va)

last = v56
prefetch

