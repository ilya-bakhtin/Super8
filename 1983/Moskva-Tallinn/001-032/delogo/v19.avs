SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

v19 = v19.expr("sx 100 < sy 160 < & 0 x ?", "x", "x")

mw = 100
mh = 160

v19_m = v19.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 20, dh1 = 20, mask_tolerance = 0)
#v19_m = v19.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 150)

expY = "sx 900 < sy 900 sx - 16 / < & x 250 < & x[0,40] 1.04 * x ?"
expC = "sx 900 < sy 900 sx - 16 / < & x 250 < & x[0,40] x ?"
v19 = v19.expr(expY, expC, expC)

v19 = v19.convertToRGB32(interlaced=false, matrix="PC.709")
v19 = v19.ExInpaint(mask = v19_m)
#return v19.interleave(v19_m)
v19 = v19.convertToYV24(interlaced=false, matrix="PC.709")

v19c = v19.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v19r = v19.crop(mw, 0, 0, mh)
v19b = v19.crop(0, mh, 0, 0)
v19 = v19c.stackHorizontal(v19r).stackVertical(v19b)

va = BlankClip(v19, audio_rate = 48000, channels = 2).killVideo
v19 = v19.audioDub(va)

last = v19
prefetch

