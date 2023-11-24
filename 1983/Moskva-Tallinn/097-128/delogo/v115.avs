import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 150 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v115_m = v115.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 2.5
expY = "sx 950 < sy 950 sx - 23 / 10 + < & x[0,42] x ?"
expM = "sx 950 < sy 950 sx - 23 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 23 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 23 / 10 + < & x[0,42] x ?"
v115 = v115.expr(v115, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 23 / 10 + < & x[-30,0] x ?"
v115 = v115.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 23 / 10 + < & x[0,-42] x ?"
v115 = v115.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 23 / 10 + < & x[30,0] x ?"
v115 = v115.expr(exp, exp, exp)

#v115_m = v115.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v115o = v115
v115 = v115.convertToRGB32(interlaced=false, matrix="PC.709")
#return v115.interleave(v115_m)#.info
v115 = v115.ExInpaint(mask = v115_m)
v115 = v115.convertToYV24(interlaced=false, matrix="PC.709")

v115wob = v115
v115_mYV = v115_m.convertToYV24(interlaced=false, matrix="PC.709")
v115_mYV = v115_mYV.extractY.expr(expM).convertToYV24
v115_m = v115_mYV.gaussResize(v115.width/16, v115.height/16).gaussResize(v115.width, v115.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v115_mYV.interleave(v115_m)
v115b = v115.gaussResize(v115.width/8, v115.height/8).gaussResize(v115.width, v115.height)
#return v115o.interleave(v115b)
v115 = v115o.mt_merge(v115b, v115_m, luma = true)
/*
# 129 -> 130..138
v115_mYV = v115_mYV.extractY.expr(expMt).convertToYV24
v115_m = v115_mYV.gaussResize(v115.width/16, v115.height/16).gaussResize(v115.width, v115.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v115_m.histogram
v115_129 = v115.trim(129, -1)
v115 = v115.trim(0, 129) + v115.trim(130, 138).mt_merge(v115_129.loop(0, 10), v115_m, luma = true) + v115.trim(139, 0)
*/
#v115 = v115wob.interleave(v115)

v115 = v115.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v115, audio_rate = 48000, channels = 2).killVideo
v115 = v115.audioDub(va)

last = v115
prefetch

