import("..\1983-Moskva-Tallinn.avs")

exp = "160 mw^ 150 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v141_m = v141.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 2.
expY = "sx 950 < sy 950 sx - 28 / 10 + < & x[0,33] x ?"
expM = "sx 950 < sy 950 sx - 28 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 28 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 28 / 10 + < & x[0,33] x ?"
v141 = v141.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 28 / 10 + < & x[-24,0] x ?"
v141 = v141.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 28 / 10 + < & x[0,-33] x ?"
v141 = v141.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 28 / 10 + < & x[24,0] x ?"
v141 = v141.expr(exp, exp, exp)

#v141_m = v141.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v141o = v141
v141 = v141.convertToRGB32(interlaced=false, matrix="PC.709")
#return v141.interleave(v141_m)#.info
v141 = v141.ExInpaint(mask = v141_m)
v141 = v141.convertToYV24(interlaced=false, matrix="PC.709")

v141wob = v141
v141_mYV = v141_m.convertToYV24(interlaced=false, matrix="PC.709")
v141_mYV = v141_mYV.extractY.expr(expM).convertToYV24
v141_m = v141_mYV.gaussResize(v141.width/16, v141.height/16).gaussResize(v141.width, v141.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v141_mYV.interleave(v141_m)
v141b = v141.gaussResize(v141.width/16, v141.height/16).gaussResize(v141.width, v141.height)
#return v141o.interleave(v141b)
v141 = v141o.mt_merge(v141b, v141_m, luma = true)
/*
# 129 -> 130..138
v141_mYV = v141_mYV.extractY.expr(expMt).convertToYV24
v141_m = v141_mYV.gaussResize(v141.width/16, v141.height/16).gaussResize(v141.width, v141.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v141_m.histogram
v141_129 = v141.trim(129, -1)
v141 = v141.trim(0, 129) + v141.trim(130, 138).mt_merge(v141_129.loop(0, 10), v141_m, luma = true) + v141.trim(139, 0)
*/
#v141 = v141wob.interleave(v141)

#v141 = v141.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v141, audio_rate = 48000, channels = 2).killVideo
v141 = v141.audioDub(va)

last = v141
prefetch

