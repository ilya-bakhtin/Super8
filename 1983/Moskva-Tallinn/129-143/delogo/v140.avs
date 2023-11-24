import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v140_m = v140.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.
expY = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 14 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
v140 = v140.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v140 = v140.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v140 = v140.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v140 = v140.expr(exp, exp, exp)

#v140_m = v140.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v140o = v140
v140 = v140.convertToRGB32(interlaced=false, matrix="PC.709")
#return v140.interleave(v140_m)#.info
v140 = v140.ExInpaint(mask = v140_m)
v140 = v140.convertToYV24(interlaced=false, matrix="PC.709")

v140wob = v140
v140_mYV = v140_m.convertToYV24(interlaced=false, matrix="PC.709")
v140_mYV = v140_mYV.extractY.expr(expM).convertToYV24
v140_m = v140_mYV.gaussResize(v140.width/16, v140.height/16).gaussResize(v140.width, v140.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v140_mYV.interleave(v140_m)
v140b = v140.gaussResize(v140.width/16, v140.height/16).gaussResize(v140.width, v140.height)
#return v140o.interleave(v140b)
v140 = v140o.mt_merge(v140b, v140_m, luma = true)
/*
# 129 -> 130..138
v140_mYV = v140_mYV.extractY.expr(expMt).convertToYV24
v140_m = v140_mYV.gaussResize(v140.width/16, v140.height/16).gaussResize(v140.width, v140.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v140_m.histogram
v140_129 = v140.trim(129, -1)
v140 = v140.trim(0, 129) + v140.trim(130, 138).mt_merge(v140_129.loop(0, 10), v140_m, luma = true) + v140.trim(139, 0)
*/
#v140 = v140wob.interleave(v140)

#v140 = v140.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v140, audio_rate = 48000, channels = 2).killVideo
v140 = v140.audioDub(va)

last = v140
prefetch

