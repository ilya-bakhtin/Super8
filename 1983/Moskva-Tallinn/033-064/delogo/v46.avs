SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v46 = v46.deScratch(maxwidth=5, mindif=1)

v46_m = v46.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v46 = v46.convertToRGB32(interlaced=false, matrix="PC.709")

v46 = v46.ExInpaint(mask = v46_m)
v46 = v46.convertToYV24(interlaced=false)

va = BlankClip(v46, audio_rate = 48000, channels = 2).killVideo
v46 = v46.audioDub(va)

last = v46
prefetch

