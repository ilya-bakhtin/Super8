import("..\1983-Moskva-Tallinn.avs")

exp = "160 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v128_m = v128.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v128 = v128.expr(v128, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v128 = v128.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v128 = v128.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v128 = v128.expr(exp, exp, exp)

#v128_m = v128.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v128o = v128
v128 = v128.convertToRGB32(interlaced=false, matrix="PC.709")
#return v128.interleave(v128_m)#.info
v128 = v128.ExInpaint(mask = v128_m)
v128 = v128.convertToYV24(interlaced=false, matrix="PC.709")

v128wob = v128
v128_mYV = v128_m.convertToYV24(interlaced=false, matrix="PC.709")
v128_mYV = v128_mYV.extractY.expr(expM).convertToYV24
v128_m = v128_mYV.gaussResize(v128.width/16, v128.height/16).gaussResize(v128.width, v128.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v128_mYV.interleave(v128_m)
v128b = v128.gaussResize(v128.width/32, v128.height/32).gaussResize(v128.width, v128.height)
#return v128o.interleave(v128b)
v128 = v128o.mt_merge(v128b, v128_m, luma = true)
/*
# 129 -> 130..138
v128_mYV = v128_mYV.extractY.expr(expMt).convertToYV24
v128_m = v128_mYV.gaussResize(v128.width/16, v128.height/16).gaussResize(v128.width, v128.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v128_m.histogram
v128_129 = v128.trim(129, -1)
v128 = v128.trim(0, 129) + v128.trim(130, 138).mt_merge(v128_129.loop(0, 10), v128_m, luma = true) + v128.trim(139, 0)
*/
#v128 = v128wob.interleave(v128)

v128 = v128.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v128, audio_rate = 48000, channels = 2).killVideo
v128 = v128.audioDub(va)

last = v128
prefetch

