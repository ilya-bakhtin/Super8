import("..\1983-Moskva-Tallinn.avs")

exp = "160 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v130_m = v130.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v130 = v130.expr(v130, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v130 = v130.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v130 = v130.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v130 = v130.expr(exp, exp, exp)

#v130_m = v130.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v130o = v130
v130 = v130.convertToRGB32(interlaced=false, matrix="PC.709")
#return v130.interleave(v130_m)#.info
v130 = v130.ExInpaint(mask = v130_m)
v130 = v130.convertToYV24(interlaced=false, matrix="PC.709")

v130wob = v130
v130_mYV = v130_m.convertToYV24(interlaced=false, matrix="PC.709")
v130_mYV = v130_mYV.extractY.expr(expM).convertToYV24
v130_m = v130_mYV.gaussResize(v130.width/16, v130.height/16).gaussResize(v130.width, v130.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v130_mYV.interleave(v130_m)
v130b = v130.gaussResize(v130.width/32, v130.height/32).gaussResize(v130.width, v130.height)
#return v130o.interleave(v130b)
v130 = v130o.mt_merge(v130b, v130_m, luma = true)
/*
# 129 -> 130..138
v130_mYV = v130_mYV.extractY.expr(expMt).convertToYV24
v130_m = v130_mYV.gaussResize(v130.width/16, v130.height/16).gaussResize(v130.width, v130.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v130_m.histogram
v130_129 = v130.trim(129, -1)
v130 = v130.trim(0, 129) + v130.trim(130, 138).mt_merge(v130_129.loop(0, 10), v130_m, luma = true) + v130.trim(139, 0)
*/
#v130 = v130wob.interleave(v130)

#v130 = v130.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v130, audio_rate = 48000, channels = 2).killVideo
v130 = v130.audioDub(va)

last = v130
prefetch

