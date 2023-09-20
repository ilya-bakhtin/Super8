SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v85 = v85.deScratch(maxwidth=5, mindif=1)

v85_m = v85.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v85 = v85.convertToRGB32(interlaced=false, matrix="PC.709")

v85 = v85.ExInpaint(mask = v85_m)
v85 = v85.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

last = v85
prefetch

