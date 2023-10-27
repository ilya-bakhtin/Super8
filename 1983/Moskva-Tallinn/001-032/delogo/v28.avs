SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

v28 = v28.expr("sx 80 < sy 160 < & 0 x ?", "x", "x")

mw = 80
mh = 160

v28_m = v28.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 20, dh1 = 20, mask_tolerance = 0)
#v28_m = v28.PrepareMask#(mask_tolerance = 200)

expY = "sx 900 < sy 900 sx - 11 / < & x 250 < & x[0,70] 1.04 * x ?"
expC = "sx 900 < sy 900 sx - 11 / < & x 250 < & x[0,70] x ?"
v28 = v28.expr(expY, expC, expC)
exp = "sy 600 < width sx - 600 sy - 11 / < & x 250 < & x[-50,0] x ?"
v28 = v28.expr(exp, exp, exp)

v28 = v28.convertToRGB32(interlaced=false, matrix="PC.709")
v28 = v28.ExInpaint(mask = v28_m)
v28 = v28.convertToYV24(interlaced=false, matrix="PC.709")

exp = "sx 200 > sx 500 < & sy 900 sx - 11 / < & x[-200,0] x ?"
v28 = v28.expr(exp, exp, exp)
exp = "sy 100 > sy 600 < & width sx - 600 sy - 11 / < & x[0,-100] x ?"
v28 = v28.expr(exp, exp, exp)
exp = "sy 200 > sy 600 < & width sx - 600 sy - 11 / < & x[0,-200] x ?"
v28 = v28.expr(exp, exp, exp)

v28c = v28.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v28r = v28.crop(mw, 0, 0, mh)
v28b = v28.crop(0, mh, 0, 0)
v28 = v28c.stackHorizontal(v28r).stackVertical(v28b)

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

last = v28
prefetch

