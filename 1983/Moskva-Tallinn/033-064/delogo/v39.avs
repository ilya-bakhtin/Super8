SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

mw = 100
mh = 140

v39 = v39.expr("sx 100 < sy 140 < & 0 x ?", "x", "x")

v39_m = v39.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 20, dh1 = 20, mask_tolerance = 0)
#v39_m = v39.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

exp = "sx 920 < sy 920 sx - 12 / < & x[0,70] x ?"
v39 = v39.expr(exp, exp, exp)
exp = "sy 400 < width sx - 400 sy - 12 / < & x[-40,0] x ?"
# sy < 400 && (width - sx) < (400 - sy) / 12
v39 = v39.expr(exp, exp, exp)
exp = "width sx - 600 < height sy - 600 width sx - - 12 / < & x[0,-50] x ?"
# width - sx < 600 && height - sy < (600 - (width - sx)) / 12
v39 = v39.expr(exp, exp, exp)
exp = "height sy - 700 < sx 700 height sy - - 12 / < & x[50,0] x ?"
v39 = v39.expr(exp, exp, exp)

v39 = v39.convertToRGB32(interlaced=false, matrix="PC.709")
#return v39.interleave(v39_m)
v39 = v39.ExInpaint(mask = v39_m)
v39 = v39.convertToYV24(interlaced=false, matrix="PC.709")

v39c = v39.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v39r = v39.crop(mw, 0, 0, mh)
v39b = v39.crop(0, mh, 0, 0)
v39 = v39c.stackHorizontal(v39r).stackVertical(v39b)

va = BlankClip(v39, audio_rate = 48000, channels = 2).killVideo
v39 = v39.audioDub(va)

last = v39
prefetch

