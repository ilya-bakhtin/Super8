SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v50_m = v50.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.5
expY = "sx 950 < sy 950 sx - 12 / 0 + < & x[0,74] x ?"
expM = "sx 950 < sy 950 sx - 12 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 12 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 12 / 0 + < & x[0,74] x ?"
v50 = v50.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 12 / 10 + < & x[-52,0] x ?"
v50 = v50.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 12 / 10 + < & x[0,-74] x ?"
v50 = v50.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 12 / 10 + < & x[52,0] x ?"
v50 = v50.expr(exp, exp, exp)

#v50_m = v50.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v50o = v50
v50 = v50.convertToRGB32(interlaced=false, matrix="PC.709")
#return v50.interleave(v50_m)#.info
v50 = v50.ExInpaint(mask = v50_m)
v50 = v50.convertToYV24(interlaced=false, matrix="PC.709")

v50wob = v50
v50_mYV = v50_m.convertToYV24(interlaced=false, matrix="PC.709")
v50_mYV = v50_mYV.extractY.expr(expM).convertToYV24
v50_m = v50_mYV.gaussResize(v50.width/8, v50.height/8).gaussResize(v50.width, v50.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v50_mYV.interleave(v50_m)
v50b = v50.gaussResize(v50.width/16, v50.height/16).gaussResize(v50.width, v50.height)
#return v50o.interleave(v50b)
v50 = v50o.mt_merge(v50b, v50_m, luma = true)

# 87 -> 72..86
v50_mYV = v50_mYV.extractY.expr(expMt).convertToYV24
v50_m = v50_mYV.gaussResize(v50.width/16, v50.height/16).gaussResize(v50.width, v50.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v50_m.histogram
v50_129 = v50.trim(87, -1)
v50 = v50.trim(0, 71) + v50.trim(72, 86).mt_merge(v50_129.loop(0, 10), v50_m, luma = true) + v50.trim(87, 0)

#v50 = v50wob.interleave(v50)

v50 = v50.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

last = v50
prefetch

