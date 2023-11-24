import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v138_m = v138.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v138 = v138.expr(v138, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v138 = v138.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v138 = v138.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v138 = v138.expr(exp, exp, exp)

#v138_m = v138.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v138o = v138
v138 = v138.convertToRGB32(interlaced=false, matrix="PC.709")
#return v138.interleave(v138_m)#.info
v138 = v138.ExInpaint(mask = v138_m)
v138 = v138.convertToYV24(interlaced=false, matrix="PC.709")

v138wob = v138
v138_mYV = v138_m.convertToYV24(interlaced=false, matrix="PC.709")
v138_mYV = v138_mYV.extractY.expr(expM).convertToYV24
v138_m = v138_mYV.gaussResize(v138.width/16, v138.height/16).gaussResize(v138.width, v138.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v138_mYV.interleave(v138_m)
v138b = v138.gaussResize(v138.width/32, v138.height/32).gaussResize(v138.width, v138.height)
#return v138o.interleave(v138b)
v138 = v138o.mt_merge(v138b, v138_m, luma = true)
/*
# 129 -> 130..138
v138_mYV = v138_mYV.extractY.expr(expMt).convertToYV24
v138_m = v138_mYV.gaussResize(v138.width/16, v138.height/16).gaussResize(v138.width, v138.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v138_m.histogram
v138_129 = v138.trim(129, -1)
v138 = v138.trim(0, 129) + v138.trim(130, 138).mt_merge(v138_129.loop(0, 10), v138_m, luma = true) + v138.trim(139, 0)
*/
#v138 = v138wob.interleave(v138)

#v138 = v138.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v138, audio_rate = 48000, channels = 2).killVideo
v138 = v138.audioDub(va)

last = v138
prefetch

