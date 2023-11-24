import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 160 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v112_m = v112.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
v112 = v112.expr(v112, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v112 = v112.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v112 = v112.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v112 = v112.expr(exp, exp, exp)

#v112_m = v112.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v112o = v112
v112 = v112.convertToRGB32(interlaced=false, matrix="PC.709")
#return v112.interleave(v112_m)#.info
v112 = v112.ExInpaint(mask = v112_m)
v112 = v112.convertToYV24(interlaced=false, matrix="PC.709")

v112wob = v112
v112_mYV = v112_m.convertToYV24(interlaced=false, matrix="PC.709")
v112_mYV = v112_mYV.extractY.expr(expM).convertToYV24
v112_m = v112_mYV.gaussResize(v112.width/16, v112.height/16).gaussResize(v112.width, v112.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v112_mYV.interleave(v112_m)
v112b = v112.gaussResize(v112.width/8, v112.height/8).gaussResize(v112.width, v112.height)
#return v112o.interleave(v112b)
v112 = v112o.mt_merge(v112b, v112_m, luma = true)

# 129 -> 130..138
v112_mYV = v112_mYV.extractY.expr(expMt).convertToYV24
v112_m = v112_mYV.gaussResize(v112.width/16, v112.height/16).gaussResize(v112.width, v112.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v112_m.histogram
v112_129 = v112.trim(129, -1)
v112 = v112.trim(0, 129) + v112.trim(130, 138).mt_merge(v112_129.loop(10), v112_m, luma = true) + v112.trim(139, 0)

#v112 = v112wob.interleave(v112)

v112 = v112.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

last = v112
prefetch

