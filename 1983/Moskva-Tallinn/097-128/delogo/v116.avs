import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v116_m = v116.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v116 = v116.expr(v116, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v116 = v116.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v116 = v116.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v116 = v116.expr(exp, exp, exp)

#v116_m = v116.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v116o = v116
v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")
#return v116.interleave(v116_m)#.info
v116 = v116.ExInpaint(mask = v116_m)
v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")

v116wob = v116
v116_mYV = v116_m.convertToYV24(interlaced=false, matrix="PC.709")
v116_mYV = v116_mYV.extractY.expr(expM).convertToYV24
v116_m = v116_mYV.gaussResize(v116.width/16, v116.height/16).gaussResize(v116.width, v116.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v116_mYV.interleave(v116_m)
v116b = v116.gaussResize(v116.width/8, v116.height/8).gaussResize(v116.width, v116.height)
#return v116o.interleave(v116b)
v116 = v116o.mt_merge(v116b, v116_m, luma = true)
/*
# 129 -> 130..138
v116_mYV = v116_mYV.extractY.expr(expMt).convertToYV24
v116_m = v116_mYV.gaussResize(v116.width/16, v116.height/16).gaussResize(v116.width, v116.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v116_m.histogram
v116_129 = v116.trim(129, -1)
v116 = v116.trim(0, 129) + v116.trim(130, 138).mt_merge(v116_129.loop(0, 10), v116_m, luma = true) + v116.trim(139, 0)
*/
#v116 = v116wob.interleave(v116)

v116 = v116.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v116, audio_rate = 48000, channels = 2).killVideo
v116 = v116.audioDub(va)

last = v116
prefetch

