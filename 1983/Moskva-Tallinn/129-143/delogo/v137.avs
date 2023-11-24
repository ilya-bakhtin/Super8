import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 150 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v137_m = v137.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 2.
expY = "sx 950 < sy 950 sx - 28 / 10 + < & x[0,33] x ?"
expM = "sx 950 < sy 950 sx - 28 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 28 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 28 / 10 + < & x[0,33] x ?"
v137 = v137.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 28 / 10 + < & x[-24,0] x ?"
v137 = v137.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 28 / 10 + < & x[0,-33] x ?"
v137 = v137.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 28 / 10 + < & x[24,0] x ?"
v137 = v137.expr(exp, exp, exp)

#v137_m = v137.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v137o = v137
v137 = v137.convertToRGB32(interlaced=false, matrix="PC.709")
#return v137.interleave(v137_m)#.info
v137 = v137.ExInpaint(mask = v137_m)
v137 = v137.convertToYV24(interlaced=false, matrix="PC.709")

v137wob = v137
v137_mYV = v137_m.convertToYV24(interlaced=false, matrix="PC.709")
v137_mYV = v137_mYV.extractY.expr(expM).convertToYV24
v137_m = v137_mYV.gaussResize(v137.width/16, v137.height/16).gaussResize(v137.width, v137.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v137_mYV.interleave(v137_m)
v137b = v137.gaussResize(v137.width/16, v137.height/16).gaussResize(v137.width, v137.height)
#return v137o.interleave(v137b)
v137 = v137o.mt_merge(v137b, v137_m, luma = true)
/*
# 129 -> 130..138
v137_mYV = v137_mYV.extractY.expr(expMt).convertToYV24
v137_m = v137_mYV.gaussResize(v137.width/16, v137.height/16).gaussResize(v137.width, v137.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v137_m.histogram
v137_129 = v137.trim(129, -1)
v137 = v137.trim(0, 129) + v137.trim(130, 138).mt_merge(v137_129.loop(0, 10), v137_m, luma = true) + v137.trim(139, 0)
*/
#v137 = v137wob.interleave(v137)

#v137 = v137.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v137, audio_rate = 48000, channels = 2).killVideo
v137 = v137.audioDub(va)

last = v137
prefetch

