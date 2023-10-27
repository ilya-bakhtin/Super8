SetFilterMTMode("Deshaker", MT_SERIALIZED)
import("..\1983-Moskva-Tallinn.avs")

v17 = v17.expr("sx 120 < sy 160 < & 0 x ?", "x", "x")

mw = 120
mh = 160

v17_m = v17.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 10, dh1 = 10, mask_tolerance = 0)
#v17_m = v17.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 140)
#return v17_m

expY = "sx 1200 < sy 1200 sx - 14 / < & x 250 < & x[0,58] 1.04 * x ?"
expC = "sx 1200 < sy 1200 sx - 14 / < & x 250 < & x[0,58] x ?"
v17 = v17.expr(expY, expC, expC)
exp = "sy 200 < width sx - 200 sy - 14 / < & x 250 < & x[-50,0] 1.02 * x ?"
v17 = v17.expr(exp, exp, exp)

v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")

v17 = v17.ExInpaint(mask = v17_m)
v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")

v17c = v17.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v17r = v17.crop(mw, 0, 0, mh)
v17b = v17.crop(0, mh, 0, 0)
v17 = v17c.stackHorizontal(v17r).stackVertical(v17b)

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

last = v17
prefetch

