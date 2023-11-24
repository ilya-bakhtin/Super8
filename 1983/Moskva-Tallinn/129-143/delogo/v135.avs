import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v135_m = v135.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.
expY = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 14 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
v135 = v135.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v135 = v135.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v135 = v135.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v135 = v135.expr(exp, exp, exp)

#v135_m = v135.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v135o = v135
v135 = v135.convertToRGB32(interlaced=false, matrix="PC.709")
#return v135.interleave(v135_m)#.info
v135 = v135.ExInpaint(mask = v135_m)
v135 = v135.convertToYV24(interlaced=false, matrix="PC.709")

v135wob = v135
v135_mYV = v135_m.convertToYV24(interlaced=false, matrix="PC.709")
v135_mYV = v135_mYV.extractY.expr(expM).convertToYV24
v135_m = v135_mYV.gaussResize(v135.width/16, v135.height/16).gaussResize(v135.width, v135.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v135_mYV.interleave(v135_m)
v135b = v135.gaussResize(v135.width/16, v135.height/16).gaussResize(v135.width, v135.height)
#return v135o.interleave(v135b)
v135 = v135o.mt_merge(v135b, v135_m, luma = true)
/*
# 129 -> 130..138
v135_mYV = v135_mYV.extractY.expr(expMt).convertToYV24
v135_m = v135_mYV.gaussResize(v135.width/16, v135.height/16).gaussResize(v135.width, v135.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v135_m.histogram
v135_129 = v135.trim(129, -1)
v135 = v135.trim(0, 129) + v135.trim(130, 138).mt_merge(v135_129.loop(0, 10), v135_m, luma = true) + v135.trim(139, 0)
*/
#v135 = v135wob.interleave(v135)

#v135 = v135.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v135, audio_rate = 48000, channels = 2).killVideo
v135 = v135.audioDub(va)

last = v135
prefetch

