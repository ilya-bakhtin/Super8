SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

v10 = v10.expr("sx 100 < sy 160 < & 0 x ?", "x", "x")

v10_m = v10.PrepareMask(mask_w =100, mask_h = 160, dw1 = 10, dh1 = 10, mask_tolerance = 0)

v10 = v10.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 800 < sy 800 sx - 8 / < & x 250 < & x[0,40] 1.02 * x ?"
v10 = v10.expr(exp, exp, exp)
v10 = v10.convertToRGB32

v10 = v10.ExInpaint(mask = v10_m)
#return v10.interleave(v10_m)
v10 = v10.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v10, audio_rate = 48000, channels = 2).killVideo
v10 = v10.audioDub(va)

last = v10
prefetch

