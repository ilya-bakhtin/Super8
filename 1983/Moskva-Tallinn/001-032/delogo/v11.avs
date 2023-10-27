SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

v11 = v11.trim(0, 182) + v11.trim(183, 0).expr("sx 120 < sy 160 < & 0 x ?", "x", "x")

v11_m = v11.trim(0, 182).PrepareMask(mask_w = 140, mask_h = 140) +\
        v11.trim(183, 0).PrepareMask(mask_w = 140, mask_h = 160, dw1 = 10, dh1 = 10, mask_tolerance = 0)
#return v11_m

v11_l = v11.trim(0, 182).convertToRGB32(interlaced=false, matrix="PC.709")

v11_r = v11.trim(183, 0).ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
# sx < 800  && sy < (800 - sx) / 8
#exp = "sx 800 < sy 800 sx - 8 / < & x 250 < & x[0,40] 1.02 * x ?"
exp = "sx 1100 frameno 32 + * 56 / < sy 1100 frameno 32 + * 56 / sx - 16 / < & x 250 < & x[0,40] 1.02 * x ?"
v11_r = v11_r.expr(exp, exp, exp)
v11_r = v11_r.convertToRGB32

v11 = (v11_l + v11_r).ExInpaint(mask = v11_m)
v11 = v11.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v11, audio_rate = 48000, channels = 2).killVideo
v11 = v11.audioDub(va)

last = v11
prefetch

