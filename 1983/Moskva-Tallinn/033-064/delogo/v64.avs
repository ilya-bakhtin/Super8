SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v64 = v64.deScratch(maxwidth=5, mindif=1)

v64_m = v64.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v64 = v64.convertToRGB32(interlaced=false, matrix="PC.709")

v64 = v64.ExInpaint(mask = v64_m)
v64 = v64.convertToYV24(interlaced=false)

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

last = v64
prefetch

