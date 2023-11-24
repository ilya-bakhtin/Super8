SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

mw = 140
mh = 140

exp = "sx 140 < sy 140 < & 255 0 ?"
v44_m = v44.extractY.expr(exp).convertToRGB32

#v44_m = v44_m.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 40, dh1 = 40, mask_tolerance = 0)
#v44_m = v44.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

expY = "sx 950 < sy 950 sx - 23 / < & x[0,30] 1.04 * x ?"
expC = "sx 950 < sy 950 sx - 23 / < & x[0,30] x ?"
v44 = v44.expr(expY, expC, expC)
/*
exp = "sy 400 < width sx - 400 sy - 19 / < & x[-30,0] x ?"
# sy < 400 && (width - sx) < (400 - sy) / 19
v44 = v44.expr(exp, exp, exp)
exp = "width sx - 600 < height sy - 600 width sx - - 19 / < & x[0,-30] x ?"
# width - sx < 600 && height - sy < (600 - (width - sx)) / 19
v44 = v44.expr(exp, exp, exp)
exp = "height sy - 700 < sx 700 height sy - - 19 / < & x[30,0] x ?"
v44 = v44.expr(exp, exp, exp)
*/

v44 = v44.convertToRGB32(interlaced=false, matrix="PC.709")
#return v44.interleave(v44_m)
v44 = v44.ExInpaint(mask = v44_m)
v44 = v44.convertToYV24(interlaced=false, matrix="PC.709")

v44c = v44.crop(0, 0, mw, mh)./*blur(1.5).blur(1.5).blur(1.5).*/gaussResize(mw/2, mh/2).gaussResize(mw, mh)
v44r = v44.crop(mw, 0, 0, mh)
v44b = v44.crop(0, mh, 0, 0)
v44 = v44c.stackHorizontal(v44r).stackVertical(v44b)

va = BlankClip(v44, audio_rate = 48000, channels = 2).killVideo
v44 = v44.audioDub(va)

last = v44
prefetch

