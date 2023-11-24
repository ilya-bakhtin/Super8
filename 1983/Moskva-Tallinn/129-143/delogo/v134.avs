import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v134_m = v134.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.
expY = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 14 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
v134 = v134.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v134 = v134.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v134 = v134.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v134 = v134.expr(exp, exp, exp)

#v134_m = v134.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v134o = v134
v134 = v134.convertToRGB32(interlaced=false, matrix="PC.709")
#return v134.interleave(v134_m)#.info
v134 = v134.ExInpaint(mask = v134_m)
v134 = v134.convertToYV24(interlaced=false, matrix="PC.709")

v134wob = v134
v134_mYV = v134_m.convertToYV24(interlaced=false, matrix="PC.709")
v134_mYV = v134_mYV.extractY.expr(expM).convertToYV24
v134_m = v134_mYV.gaussResize(v134.width/16, v134.height/16).gaussResize(v134.width, v134.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v134_mYV.interleave(v134_m)
v134b = v134.gaussResize(v134.width/16, v134.height/16).gaussResize(v134.width, v134.height)
#return v134o.interleave(v134b)
v134 = v134o.mt_merge(v134b, v134_m, luma = true)
/*
# 129 -> 130..138
v134_mYV = v134_mYV.extractY.expr(expMt).convertToYV24
v134_m = v134_mYV.gaussResize(v134.width/16, v134.height/16).gaussResize(v134.width, v134.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v134_m.histogram
v134_129 = v134.trim(129, -1)
v134 = v134.trim(0, 129) + v134.trim(130, 138).mt_merge(v134_129.loop(0, 10), v134_m, luma = true) + v134.trim(139, 0)
*/
#v134 = v134wob.interleave(v134)

#v134 = v134.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v134, audio_rate = 48000, channels = 2).killVideo
v134 = v134.audioDub(va)

last = v134
prefetch

