SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

import("..\1983-Moskva-Tallinn.avs")

#v14 = v14.expr("sx 100 < sy 140 < & 0 x ?", "x", "x")

mw = 120
mh = 120
#v14_m = v14.PrepareMask(mask_w = 140, mask_h = 160, dw1 = 10, dh1 = 10, mask_tolerance = 0)
v14_m = v14.PrepareMask(mask_w = mw, mask_h = mh)#(mask_tolerance = 200)
#return v14_m
v14 = v14.ConvertToRGB32(interlaced=false, matrix="PC.709")
/*
v14 = v14.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 800 < sy 800 sx - 16 / < & x 250 < & x[0,40] 1.02 * x ?"
v14 = v14.expr(exp, exp, exp)
v14 = v14.convertToRGB32
*/

v14 = v14.ExInpaint(mask = v14_m)
v14 = v14.convertToYV24(interlaced=false, matrix="PC.709")

v14c = v14.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v14r = v14.crop(mw, 0, 0, mh)
v14b = v14.crop(0, mh, 0, 0)
v14 = v14c.stackHorizontal(v14r).stackVertical(v14b)

va = BlankClip(v14, audio_rate = 48000, channels = 2).killVideo
v14 = v14.audioDub(va)

last = v14
prefetch

