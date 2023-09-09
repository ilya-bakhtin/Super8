SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v35 = v35.deScratch(maxwidth=5, mindif=1)

v35_m = v35.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v35 = v35.convertToRGB32(interlaced=false, matrix="PC.709")

v35 = v35.ExInpaint(mask = v35_m)
v35 = v35.convertToYV24(interlaced=false)

va = BlankClip(v35, audio_rate = 48000, channels = 2).killVideo
v35 = v35.audioDub(va)

last = v35
prefetch

