import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v136_m = v136.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.
expY = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 14 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
v136 = v136.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v136 = v136.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v136 = v136.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v136 = v136.expr(exp, exp, exp)

#v136_m = v136.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v136o = v136
v136 = v136.convertToRGB32(interlaced=false, matrix="PC.709")
#return v136.interleave(v136_m)#.info
v136 = v136.ExInpaint(mask = v136_m)
v136 = v136.convertToYV24(interlaced=false, matrix="PC.709")

v136wob = v136
v136_mYV = v136_m.convertToYV24(interlaced=false, matrix="PC.709")
v136_mYV = v136_mYV.extractY.expr(expM).convertToYV24
v136_m = v136_mYV.gaussResize(v136.width/16, v136.height/16).gaussResize(v136.width, v136.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v136_mYV.interleave(v136_m)
v136b = v136.gaussResize(v136.width/16, v136.height/16).gaussResize(v136.width, v136.height)
#return v136o.interleave(v136b)
v136 = v136o.mt_merge(v136b, v136_m, luma = true)
/*
# 129 -> 130..138
v136_mYV = v136_mYV.extractY.expr(expMt).convertToYV24
v136_m = v136_mYV.gaussResize(v136.width/16, v136.height/16).gaussResize(v136.width, v136.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v136_m.histogram
v136_129 = v136.trim(129, -1)
v136 = v136.trim(0, 129) + v136.trim(130, 138).mt_merge(v136_129.loop(0, 10), v136_m, luma = true) + v136.trim(139, 0)
*/
#v136 = v136wob.interleave(v136)

#v136 = v136.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v136, audio_rate = 48000, channels = 2).killVideo
v136 = v136.audioDub(va)

last = v136
prefetch

