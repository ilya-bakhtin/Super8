import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 160 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v120_m = v120.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v120 = v120.expr(v120, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v120 = v120.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v120 = v120.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v120 = v120.expr(exp, exp, exp)

#v120_m = v120.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v120o = v120
v120 = v120.convertToRGB32(interlaced=false, matrix="PC.709")
#return v120.interleave(v120_m)#.info
v120 = v120.ExInpaint(mask = v120_m)
v120 = v120.convertToYV24(interlaced=false, matrix="PC.709")

v120wob = v120
v120_mYV = v120_m.convertToYV24(interlaced=false, matrix="PC.709")
v120_mYV = v120_mYV.extractY.expr(expM).convertToYV24
v120_m = v120_mYV.gaussResize(v120.width/16, v120.height/16).gaussResize(v120.width, v120.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v120_mYV.interleave(v120_m)
v120b = v120.gaussResize(v120.width/16, v120.height/16).gaussResize(v120.width, v120.height)
#return v120o.interleave(v120b)
v120 = v120o.mt_merge(v120b, v120_m, luma = true)
/*
# 129 -> 130..138
v120_mYV = v120_mYV.extractY.expr(expMt).convertToYV24
v120_m = v120_mYV.gaussResize(v120.width/16, v120.height/16).gaussResize(v120.width, v120.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v120_m.histogram
v120_129 = v120.trim(129, -1)
v120 = v120.trim(0, 129) + v120.trim(130, 138).mt_merge(v120_129.loop(0, 10), v120_m, luma = true) + v120.trim(139, 0)
*/
#v120 = v120wob.interleave(v120)

v120 = v120.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v120, audio_rate = 48000, channels = 2).killVideo
v120 = v120.audioDub(va)

last = v120
prefetch

