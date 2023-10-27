SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

v22 = v22.expr("sx 100 < sy 160 < & 0 x ?", "x", "x")

mw = 100
mh = 160

v22_m = v22.PrepareMask(mask_w = mw, mask_h = mh, dw1 = 20, dh1 = 20, mask_tolerance = 0)
#v22_m = v22.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v22_m

expY = "sx 900 < sy 900 sx - 16 / < & x 250 < & x[0,40] 1.04 * x ?"
expC = "sx 900 < sy 900 sx - 16 / < & x 250 < & x[0,40] x ?"
v22 = v22.expr(expY, expC, expC)

v22 = v22.convertToRGB32(interlaced=false, matrix="PC.709")

v22 = v22.ExInpaint(mask = v22_m)
v22 = v22.convertToYV24(interlaced=false, matrix="PC.709")

v22c = v22.crop(0, 0, mw, mh).blur(1.5).blur(1.5).blur(1.5).gaussResize(mw/8, mh/8).gaussResize(mw, mh)
v22r = v22.crop(mw, 0, 0, mh)
v22b = v22.crop(0, mh, 0, 0)
v22 = v22c.stackHorizontal(v22r).stackVertical(v22b)

va = BlankClip(v22, audio_rate = 48000, channels = 2).killVideo
v22 = v22.audioDub(va)

last = v22
prefetch

