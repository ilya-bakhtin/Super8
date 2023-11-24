SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v13_m = v13.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.
expY = "sx 950 < sy 950 sx - 19 / 0 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 0 + < & x[0,48] x ?"
v13 = v13.expr(v13, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v13 = v13.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v13 = v13.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v13 = v13.expr(exp, exp, exp)

#v13_m = v13.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v13o = v13
v13 = v13.convertToRGB32(interlaced=false, matrix="PC.709")
#return v13.interleave(v13_m)#.info
v13 = v13.ExInpaint(mask = v13_m)
v13 = v13.convertToYV24(interlaced=false, matrix="PC.709")

v13wob = v13
v13_mYV = v13_m.convertToYV24(interlaced=false, matrix="PC.709")
v13_mYV = v13_mYV.extractY.expr(expM).convertToYV24
v13_m = v13_mYV.gaussResize(v13.width/8, v13.height/8).gaussResize(v13.width, v13.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v13_mYV.interleave(v13_m)
v13b = v13.gaussResize(v13.width/32, v13.height/32).gaussResize(v13.width, v13.height)
#return v13o.interleave(v13b)
v13 = v13o.mt_merge(v13b, v13_m, luma = true)

# 29 -> 30..39
v13_mYV = v13_mYV.extractY.expr(expMt).convertToYV24
v13_m = v13_mYV.gaussResize(v13.width/16, v13.height/16).gaussResize(v13.width, v13.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v13_m.histogram
v13_29 = v13.trim(29, -1).loop(20)
#return v13_29
v13 = v13.trim(0, 29) + v13.trim(30, 39).mt_merge(v13_29, v13_m, luma = true) + v13.trim(40, 0)

#v13 = v13wob.interleave(v13)

v13 = v13.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

last = v13
prefetch

