SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

mw = 120
mh = 160

exp = "sx 120 < sy 160 < & 255 0 ?"
v46_m = v46.extractY.expr(exp).convertToRGB32

#v46_m = v46_m.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 40, dh1 = 40, mask_tolerance = 0)
#v46_m = v46.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

# slope 3.0
expY = "sx 950 < sy 950 sx - 17 / < & x[0,60] 1.04 * x ?"
expC = "sx 950 < sy 950 sx - 17 / < & x[0,60] x ?"
v46 = v46.expr(expY, expC, expC)
exp = "sy 380 < width sx - 380 sy - 17 / < & x[-20,0] x ?"
# sy < 380 && (width - sx) < (380 - sy) / 17
v46 = v46.expr(exp, exp, exp)
/*
exp = "width sx - 600 < height sy - 600 width sx - - 19 / < & x[0,-30] x ?"
# width - sx < 600 && height - sy < (600 - (width - sx)) / 19
v46 = v46.expr(exp, exp, exp)
exp = "height sy - 700 < sx 700 height sy - - 19 / < & x[30,0] x ?"
v46 = v46.expr(exp, exp, exp)
*/

v46 = v46.convertToRGB32(interlaced=false, matrix="PC.709")
#return v46.interleave(v46_m)
v46 = v46.ExInpaint(mask = v46_m)
v46 = v46.convertToYV24(interlaced=false, matrix="PC.709")

v46c = v46.crop(0, 0, mw, mh)./*blur(1.5).blur(1.5).blur(1.5).*/gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v46r = v46.crop(mw, 0, 0, mh)
v46b = v46.crop(0, mh, 0, 0)
v46 = v46c.stackHorizontal(v46r).stackVertical(v46b)

va = BlankClip(v46, audio_rate = 48000, channels = 2).killVideo
v46 = v46.audioDub(va)

last = v46
prefetch

