import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v124_m = v124.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
v124 = v124.expr(v124, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v124 = v124.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v124 = v124.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v124 = v124.expr(exp, exp, exp)

#v124_m = v124.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v124o = v124
v124 = v124.convertToRGB32(interlaced=false, matrix="PC.709")
#return v124.interleave(v124_m)#.info
v124 = v124.ExInpaint(mask = v124_m)
v124 = v124.convertToYV24(interlaced=false, matrix="PC.709")

v124wob = v124
v124_mYV = v124_m.convertToYV24(interlaced=false, matrix="PC.709")
v124_mYV = v124_mYV.extractY.expr(expM).convertToYV24
v124_m = v124_mYV.gaussResize(v124.width/8, v124.height/8).gaussResize(v124.width, v124.height)
#return v124_mYV.interleave(v124_m)
v124b = v124.gaussResize(v124.width/16, v124.height/16).gaussResize(v124.width, v124.height)
#return v124o.interleave(v124b)
v124 = v124o.mt_merge(v124b, v124_m, luma = true)
/*
# 129 -> 130..138
v124_mYV = v124_mYV.extractY.expr(expMt).convertToYV24
v124_m = v124_mYV.gaussResize(v124.width/16, v124.height/16).gaussResize(v124.width, v124.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v124_m.histogram
v124_129 = v124.trim(129, -1)
v124 = v124.trim(0, 129) + v124.trim(130, 138).mt_merge(v124_129.loop(0, 10), v124_m, luma = true) + v124.trim(139, 0)
*/
#v124 = v124wob.interleave(v124)

v124 = v124.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v124, audio_rate = 48000, channels = 2).killVideo
v124 = v124.audioDub(va)

last = v124
prefetch

