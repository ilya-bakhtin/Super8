import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 160 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v117_m = v117.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v117 = v117.expr(v117, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v117 = v117.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v117 = v117.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v117 = v117.expr(exp, exp, exp)

#v117_m = v117.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v117o = v117
v117 = v117.convertToRGB32(interlaced=false, matrix="PC.709")
#return v117.interleave(v117_m)#.info
v117 = v117.ExInpaint(mask = v117_m)
v117 = v117.convertToYV24(interlaced=false, matrix="PC.709")

v117wob = v117
v117_mYV = v117_m.convertToYV24(interlaced=false, matrix="PC.709")
v117_mYV = v117_mYV.extractY.expr(expM).convertToYV24
v117_m = v117_mYV.gaussResize(v117.width/16, v117.height/16).gaussResize(v117.width, v117.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v117_mYV.interleave(v117_m)
v117b = v117.gaussResize(v117.width/8, v117.height/8).gaussResize(v117.width, v117.height)
#return v117o.interleave(v117b)
v117 = v117o.mt_merge(v117b, v117_m, luma = true)
/*
# 129 -> 130..138
v117_mYV = v117_mYV.extractY.expr(expMt).convertToYV24
v117_m = v117_mYV.gaussResize(v117.width/16, v117.height/16).gaussResize(v117.width, v117.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v117_m.histogram
v117_129 = v117.trim(129, -1)
v117 = v117.trim(0, 129) + v117.trim(130, 138).mt_merge(v117_129.loop(0, 10), v117_m, luma = true) + v117.trim(139, 0)
*/
#v117 = v117wob.interleave(v117)

v117 = v117.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v117, audio_rate = 48000, channels = 2).killVideo
v117 = v117.audioDub(va)

last = v117
prefetch

