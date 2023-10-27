SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

v26 = v26.expr("sx 100 < sy 160 < & 0 x ?", "x", "x")

mw = 100
mh = 160

v26_m = v26.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 20, dh1 = 20, mask_tolerance = 0)
#v26_m = v26.PrepareMask#(mask_tolerance = 200)

expY = "sx 1200 < sy 1200 sx - 14 / < & x 250 < & x[0,70] 1.04 * x ?"
expC = "sx 1200 < sy 1200 sx - 14 / < & x 250 < & x[0,70] x ?"
v26 = v26.expr(expY, expC, expC)

v26 = v26.convertToRGB32(interlaced=false, matrix="PC.709")
v26 = v26.ExInpaint(mask = v26_m)
v26 = v26.convertToYV24(interlaced=false, matrix="PC.709")

v26c = v26.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v26r = v26.crop(mw, 0, 0, mh)
v26b = v26.crop(0, mh, 0, 0)
v26 = v26c.stackHorizontal(v26r).stackVertical(v26b)

va = BlankClip(v26, audio_rate = 48000, channels = 2).killVideo
v26 = v26.audioDub(va)

last = v26
prefetch

