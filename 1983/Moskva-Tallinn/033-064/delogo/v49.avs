SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v49 = v49.deScratch(maxwidth=5, mindif=1)

v49_m = v49.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v49 = v49.convertToRGB32(interlaced=false, matrix="PC.709")

v49 = v49.ExInpaint(mask = v49_m)
v49 = v49.convertToYV24(interlaced=false)

va = BlankClip(v49, audio_rate = 48000, channels = 2).killVideo
v49 = v49.audioDub(va)

last = v49
prefetch

