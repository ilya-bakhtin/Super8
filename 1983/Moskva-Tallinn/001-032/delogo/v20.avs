SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v20_m = v20.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.
expY = "sx 950 < sy 950 sx - 19 / 0 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 0 + < & x[0,48] x ?"
v20 = v20.expr(v20, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v20 = v20.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v20 = v20.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v20 = v20.expr(exp, exp, exp)

#v20_m = v20.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v20o = v20
v20 = v20.convertToRGB32(interlaced=false, matrix="PC.709")
#return v20.interleave(v20_m)#.info
v20 = v20.ExInpaint(mask = v20_m)
v20 = v20.convertToYV24(interlaced=false, matrix="PC.709")

v20wob = v20
v20_mYV = v20_m.convertToYV24(interlaced=false, matrix="PC.709")
v20_mYV = v20_mYV.extractY.expr(expM).convertToYV24
v20_m = v20_mYV.gaussResize(v20.width/8, v20.height/8).gaussResize(v20.width, v20.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v20_mYV.interleave(v20_m)
v20b = v20.gaussResize(v20.width/32, v20.height/32).gaussResize(v20.width, v20.height)
#return v20o.interleave(v20b)
v20 = v20o.mt_merge(v20b, v20_m, luma = true)
/*
# 29 -> 30..39
v20_mYV = v20_mYV.extractY.expr(expMt).convertToYV24
v20_m = v20_mYV.gaussResize(v20.width/16, v20.height/16).gaussResize(v20.width, v20.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v20_m.histogram
v20_29 = v20.trim(29, -1).loop(20)
#return v20_29
v20 = v20.trim(0, 29) + v20.trim(30, 39).mt_merge(v20_29, v20_m, luma = true) + v20.trim(40, 0)
*/
#v20 = v20wob.interleave(v20)

v20 = v20.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v20, audio_rate = 48000, channels = 2).killVideo
v20 = v20.audioDub(va)

last = v20
prefetch

