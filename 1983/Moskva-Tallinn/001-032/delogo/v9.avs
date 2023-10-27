SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

v9 = v9.expr("sx 80 < sy 140 < & 0 x ?", "x", "x")

v9_m = v9.PrepareMask(mask_w = 100, mask_h = 140, dw1 = 10, dh1 = 10, mask_tolerance = 0)

v9 = v9.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 700 < sy 700 sx - 8 / < & x 250 < & x[0,40] 1.02 * x ?"
v9 = v9.expr(exp, exp, exp)
v9 = v9.convertToRGB32

v9 = v9.ExInpaint(mask = v9_m)
#return v9.interleave(v9_m)
v9 = v9.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v9, audio_rate = 48000, channels = 2).killVideo
v9 = v9.audioDub(va)

last = v9
prefetch

