SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

import("..\1983-Moskva-Tallinn.avs")

v2 = v2.expr("sx 30 < sy 100 < & 0 x ?", "x", "x")

v2_m = v2.PrepareMask(mask_w = 40, mask_h = 100, dw1 = 10, dh1 = 10, mask_tolerance = 0)
v2 = v2.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 250 < sy 16 < & x 160 < & x[0,16] x ?"
v2 = v2.expr(exp, exp, exp)
v2 = v2.convertToRGB32
#return v2_m
v2 = v2.ExInpaint(mask = v2_m)
#return v2.interleave(v2_m)
v2 = v2.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v2, audio_rate = 48000, channels = 2).killVideo
v2 = v2.audioDub(va)

last = v2
prefetch

