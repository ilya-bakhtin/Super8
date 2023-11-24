import("..\1983-Moskva-Tallinn.avs")

exp = "160 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v131_m = v131.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v131 = v131.expr(v131, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v131 = v131.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v131 = v131.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v131 = v131.expr(exp, exp, exp)

#v131_m = v131.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v131o = v131
v131 = v131.convertToRGB32(interlaced=false, matrix="PC.709")
#return v131.interleave(v131_m)#.info
v131 = v131.ExInpaint(mask = v131_m)
v131 = v131.convertToYV24(interlaced=false, matrix="PC.709")

v131wob = v131
v131_mYV = v131_m.convertToYV24(interlaced=false, matrix="PC.709")
v131_mYV = v131_mYV.extractY.expr(expM).convertToYV24
v131_m = v131_mYV.gaussResize(v131.width/16, v131.height/16).gaussResize(v131.width, v131.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v131_mYV.interleave(v131_m)
v131b = v131.gaussResize(v131.width/32, v131.height/32).gaussResize(v131.width, v131.height)
#return v131o.interleave(v131b)
v131 = v131o.mt_merge(v131b, v131_m, luma = true)
/*
# 129 -> 130..138
v131_mYV = v131_mYV.extractY.expr(expMt).convertToYV24
v131_m = v131_mYV.gaussResize(v131.width/16, v131.height/16).gaussResize(v131.width, v131.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v131_m.histogram
v131_129 = v131.trim(129, -1)
v131 = v131.trim(0, 129) + v131.trim(130, 138).mt_merge(v131_129.loop(0, 10), v131_m, luma = true) + v131.trim(139, 0)
*/
#v131 = v131wob.interleave(v131)

#v131 = v131.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v131, audio_rate = 48000, channels = 2).killVideo
v131 = v131.audioDub(va)

last = v131
prefetch

