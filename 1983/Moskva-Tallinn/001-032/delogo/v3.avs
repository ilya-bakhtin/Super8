SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

import("..\1983-Moskva-Tallinn.avs")

v3 = v3.expr("sx 50 < sy 80 < & 0 x ?", "x", "x")

v3_m = v3.PrepareMask(mask_w = 80, mask_h = 100, dw1 = 10, dh1 = 10, mask_tolerance = 0)
v3 = v3.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
#exp = "sx 250 < sy 16 < & x 160 < & x[0,16] x ?"
#v3 = v3.expr(exp, exp, exp)
v3 = v3.convertToRGB32

v3 = v3.ExInpaint(mask = v3_m)
#return v3.interleave(v3_m)
v3 = v3.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v3, audio_rate = 48000, channels = 2).killVideo
v3 = v3.audioDub(va)

last = v3
prefetch

