SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

mw = 100
mh = 180

v40_m = v40.expr("sx 100 < sy 180 < & 0 x ?", "x", "x")

v40_m = v40_m.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 40, dh1 = 40, mask_tolerance = 0)
#v40_m = v40.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

exp = "sx 960 < sy 960 sx - 9 / < & x[0,90] x ?"
v40 = v40.expr(exp, exp, exp)
exp = "sy 480 < width sx - 480 sy - 9 / < & x[-50,0] x ?"
# sy < 480 && (width - sx) < (480 - sy) / 9
v40 = v40.expr(exp, exp, exp)
exp = "width sx - 660 < height sy - 660 width sx - - 9 / < & x[0,-70] x ?"
# width - sx < 660 && height - sy < (660 - (width - sx)) / 9
v40 = v40.expr(exp, exp, exp)
exp = "height sy - 700 < sx 700 height sy - - 9 / < & x[70,0] x ?"
v40 = v40.expr(exp, exp, exp)

v40 = v40.convertToRGB32(interlaced=false, matrix="PC.709")
#return v40.interleave(v40_m)
v40 = v40.ExInpaint(mask = v40_m)
v40 = v40.convertToYV24(interlaced=false, matrix="PC.709")

v40c = v40.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v40r = v40.crop(mw, 0, 0, mh)
v40b = v40.crop(0, mh, 0, 0)
v40 = v40c.stackHorizontal(v40r).stackVertical(v40b)

va = BlankClip(v40, audio_rate = 48000, channels = 2).killVideo
v40 = v40.audioDub(va)

last = v40
prefetch

