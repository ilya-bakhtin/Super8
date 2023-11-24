import("..\1983-Moskva-Tallinn.avs")

exp = "160 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v129_m = v129.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v129 = v129.expr(v129, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v129 = v129.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v129 = v129.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v129 = v129.expr(exp, exp, exp)

#v129_m = v129.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v129o = v129
v129 = v129.convertToRGB32(interlaced=false, matrix="PC.709")
#return v129.interleave(v129_m)#.info
v129 = v129.ExInpaint(mask = v129_m)
v129 = v129.convertToYV24(interlaced=false, matrix="PC.709")

v129wob = v129
v129_mYV = v129_m.convertToYV24(interlaced=false, matrix="PC.709")
v129_mYV = v129_mYV.extractY.expr(expM).convertToYV24
v129_m = v129_mYV.gaussResize(v129.width/16, v129.height/16).gaussResize(v129.width, v129.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v129_mYV.interleave(v129_m)
v129b = v129.gaussResize(v129.width/32, v129.height/32).gaussResize(v129.width, v129.height)
#return v129o.interleave(v129b)
v129 = v129o.mt_merge(v129b, v129_m, luma = true)
/*
# 129 -> 130..138
v129_mYV = v129_mYV.extractY.expr(expMt).convertToYV24
v129_m = v129_mYV.gaussResize(v129.width/16, v129.height/16).gaussResize(v129.width, v129.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v129_m.histogram
v129_129 = v129.trim(129, -1)
v129 = v129.trim(0, 129) + v129.trim(130, 138).mt_merge(v129_129.loop(0, 10), v129_m, luma = true) + v129.trim(139, 0)
*/
#v129 = v129wob.interleave(v129)

#v129 = v129.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v129, audio_rate = 48000, channels = 2).killVideo
v129 = v129.audioDub(va)

last = v129
prefetch

