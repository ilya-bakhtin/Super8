import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 150 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v139_m = v139.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 2.
expY = "sx 950 < sy 950 sx - 28 / 10 + < & x[0,33] x ?"
expM = "sx 950 < sy 950 sx - 28 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 28 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 28 / 10 + < & x[0,33] x ?"
v139 = v139.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 28 / 10 + < & x[-24,0] x ?"
v139 = v139.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 28 / 10 + < & x[0,-33] x ?"
v139 = v139.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 28 / 10 + < & x[24,0] x ?"
v139 = v139.expr(exp, exp, exp)

#v139_m = v139.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v139o = v139
v139 = v139.convertToRGB32(interlaced=false, matrix="PC.709")
#return v139.interleave(v139_m)#.info
v139 = v139.ExInpaint(mask = v139_m)
v139 = v139.convertToYV24(interlaced=false, matrix="PC.709")

v139wob = v139
v139_mYV = v139_m.convertToYV24(interlaced=false, matrix="PC.709")
v139_mYV = v139_mYV.extractY.expr(expM).convertToYV24
v139_m = v139_mYV.gaussResize(v139.width/16, v139.height/16).gaussResize(v139.width, v139.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v139_mYV.interleave(v139_m)
v139b = v139.gaussResize(v139.width/16, v139.height/16).gaussResize(v139.width, v139.height)
#return v139o.interleave(v139b)
v139 = v139o.mt_merge(v139b, v139_m, luma = true)
/*
# 129 -> 130..138
v139_mYV = v139_mYV.extractY.expr(expMt).convertToYV24
v139_m = v139_mYV.gaussResize(v139.width/16, v139.height/16).gaussResize(v139.width, v139.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v139_m.histogram
v139_129 = v139.trim(129, -1)
v139 = v139.trim(0, 129) + v139.trim(130, 138).mt_merge(v139_129.loop(0, 10), v139_m, luma = true) + v139.trim(139, 0)
*/
#v139 = v139wob.interleave(v139)

#v139 = v139.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v139, audio_rate = 48000, channels = 2).killVideo
v139 = v139.audioDub(va)

last = v139
prefetch

