SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

v13 = v13.expr("sx 100 < sy 140 < & 0 x ?", "x", "x")

v13_m = v13.PrepareMask(mask_w =140, mask_h = 160, dw1 = 10, dh1 = 10, mask_tolerance = 0)
#v13_m = v13.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v13_m
v13 = v13.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 600 < sy 600 sx - 16 / < & x 250 < & x[0,40] 1.02 * x ?"
v13 = v13.expr(exp, exp, exp)
v13 = v13.convertToRGB32

v13 = v13.ExInpaint(mask = v13_m)
#v13 = v13.interleave(v13_m)
v13 = v13.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

last = v13
prefetch

