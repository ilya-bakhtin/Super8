import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 200 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v127_m = v127.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 5.
expY = "sx 950 < sy 950 sx - 11 / 00 + < & x[0,82] x ?"
expM = "sx 950 < sy 950 sx - 11 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 11 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 11 / 00 + < & x[0,82] x ?"
v127 = v127.expr(v127, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 11 / 10 + < & x[-56,0] x ?"
v127 = v127.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 11 / 10 + < & x[0,-82] x ?"
v127 = v127.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 16 / 11 + < & x[56,0] x ?"
v127 = v127.expr(exp, exp, exp)

#v127_m = v127.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v127o = v127
v127 = v127.convertToRGB32(interlaced=false, matrix="PC.709")
#return v127.interleave(v127_m)#.info
v127 = v127.ExInpaint(mask = v127_m)
v127 = v127.convertToYV24(interlaced=false, matrix="PC.709")

v127wob = v127
v127_mYV = v127_m.convertToYV24(interlaced=false, matrix="PC.709")
v127_mYV = v127_mYV.extractY.expr(expM).convertToYV24
v127_m = v127_mYV.gaussResize(v127.width/8, v127.height/8).gaussResize(v127.width, v127.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v127_mYV.interleave(v127_m)
v127b = v127.gaussResize(v127.width/16, v127.height/16).gaussResize(v127.width, v127.height)
#return v127o.interleave(v127b)
v127 = v127o.mt_merge(v127b, v127_m, luma = true)
/*
# 129 -> 130..138
v127_mYV = v127_mYV.extractY.expr(expMt).convertToYV24
v127_m = v127_mYV.gaussResize(v127.width/16, v127.height/16).gaussResize(v127.width, v127.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v127_m.histogram
v127_129 = v127.trim(129, -1)
v127 = v127.trim(0, 129) + v127.trim(130, 138).mt_merge(v127_129.loop(0, 10), v127_m, luma = true) + v127.trim(139, 0)
*/
#v127 = v127wob.interleave(v127)

v127 = v127.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v127, audio_rate = 48000, channels = 2).killVideo
v127 = v127.audioDub(va)

last = v127
prefetch

