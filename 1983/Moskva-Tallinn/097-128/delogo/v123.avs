import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 140 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v123_m = v123.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 1.5
expY = "sx 950 < sy 950 sx - 37 / 00 + < & x[0,25] x ?"
expM = "sx 950 < sy 950 sx - 37 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 37 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 37 / 00 + < & x[0,25] x ?"
v123 = v123.expr(v123, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 37 / 10 + < & x[-18,0] x ?"
v123 = v123.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 37 / 10 + < & x[0,-25] x ?"
v123 = v123.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 37 / 10 + < & x[18,0] x ?"
v123 = v123.expr(exp, exp, exp)

#v123_m = v123.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v123o = v123
v123 = v123.convertToRGB32(interlaced=false, matrix="PC.709")
#return v123.interleave(v123_m)#.info
v123 = v123.ExInpaint(mask = v123_m)
v123 = v123.convertToYV24(interlaced=false, matrix="PC.709")

v123wob = v123
v123_mYV = v123_m.convertToYV24(interlaced=false, matrix="PC.709")
v123_mYV = v123_mYV.extractY.expr(expM).convertToYV24
v123_m = v123_mYV.gaussResize(v123.width/8, v123.height/8).gaussResize(v123.width, v123.height)
#return v123_mYV.interleave(v123_m)
v123b = v123.gaussResize(v123.width/16, v123.height/16).gaussResize(v123.width, v123.height)
#return v123o.interleave(v123b)
v123 = v123o.mt_merge(v123b, v123_m, luma = true)
/*
# 129 -> 130..138
v123_mYV = v123_mYV.extractY.expr(expMt).convertToYV24
v123_m = v123_mYV.gaussResize(v123.width/16, v123.height/16).gaussResize(v123.width, v123.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v123_m.histogram
v123_129 = v123.trim(129, -1)
v123 = v123.trim(0, 129) + v123.trim(130, 138).mt_merge(v123_129.loop(0, 10), v123_m, luma = true) + v123.trim(139, 0)
*/
#v123 = v123wob.interleave(v123)

v123 = v123.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v123, audio_rate = 48000, channels = 2).killVideo
v123 = v123.audioDub(va)

last = v123
prefetch

