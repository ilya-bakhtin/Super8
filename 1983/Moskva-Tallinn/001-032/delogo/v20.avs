SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

v20 = v20.expr("sx 100 < sy 160 < & 0 x ?", "x", "x")

mw = 100
mh = 160

v20_m = v20.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 20, dh1 = 20, mask_tolerance = 0)
#v20_m = v20.PrepareMask#(mask_tolerance = 200)

expY = "sx 900 < sy 900 sx - 16 / < & x 250 < & x[0,40] 1.04 * x ?"
expC = "sx 900 < sy 900 sx - 16 / < & x 250 < & x[0,40] x ?"
v20 = v20.expr(expY, expC, expC)

v20 = v20.convertToRGB32(interlaced=false, matrix="PC.709")

v20 = v20.ExInpaint(mask = v20_m)
v20 = v20.convertToYV24(interlaced=false, matrix="PC.709")

v20c = v20.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v20r = v20.crop(mw, 0, 0, mh)
v20b = v20.crop(0, mh, 0, 0)
v20 = v20c.stackHorizontal(v20r).stackVertical(v20b)

va = BlankClip(v20, audio_rate = 48000, channels = 2).killVideo
v20 = v20.audioDub(va)

last = v20
prefetch

