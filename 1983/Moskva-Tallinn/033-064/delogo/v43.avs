SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

mw = 130
mh = 150

v43_m = v43.expr("sx 130 < sy 150 < & 0 x ?", "x", "x")

v43_m = v43_m.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 40, dh1 = 40, mask_tolerance = 0)
#v43_m = v43.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

expY = "sx 950 < sy 950 sx - 19 / < & x[0,50] 1.04 * x ?"
expC = "sx 950 < sy 950 sx - 19 / < & x[0,50] x ?"
v43 = v43.expr(expY, expC, expC)
exp = "sy 400 < width sx - 400 sy - 19 / < & x[-30,0] x ?"
# sy < 400 && (width - sx) < (400 - sy) / 19
v43 = v43.expr(exp, exp, exp)
exp = "width sx - 600 < height sy - 600 width sx - - 19 / < & x[0,-30] x ?"
# width - sx < 600 && height - sy < (600 - (width - sx)) / 19
v43 = v43.expr(exp, exp, exp)
exp = "height sy - 700 < sx 700 height sy - - 19 / < & x[30,0] x ?"
v43 = v43.expr(exp, exp, exp)

v43 = v43.convertToRGB32(interlaced=false, matrix="PC.709")
#return v43.interleave(v43_m)
v43 = v43.ExInpaint(mask = v43_m)
v43 = v43.convertToYV24(interlaced=false, matrix="PC.709")

v43c = v43.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v43r = v43.crop(mw, 0, 0, mh)
v43b = v43.crop(0, mh, 0, 0)
v43 = v43c.stackHorizontal(v43r).stackVertical(v43b)

va = BlankClip(v43, audio_rate = 48000, channels = 2).killVideo
v43 = v43.audioDub(va)

last = v43
prefetch

