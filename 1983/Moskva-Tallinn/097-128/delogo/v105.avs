import("..\1983-Moskva-Tallinn.avs")

exp = "120 mw^ 190 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v105_m = v105.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 5
### v105 only
exp = "sx 396 > sx 438 < & sy 58 < & x[0,28] x ?"
exp = "sx 364 > sx 428 < & sy 74 < & x[0,28] x ?"
v105 = v105.expr(exp, exp, exp)
#return v105.prefetch
###
expY = "sx 950 < sy 950 sx - 11 / 00 + < & x[0,82] x ?"
expM = "sx 950 < sy 950 sx - 11 / 10 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 11 / 00 + < & x[0,82] x ?"
v105 = v105.expr(v105, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 11 / 10 + < & x[-56,0] x ?"
v105 = v105.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 11 / 10 + < & x[0,-82] x ?"
v105 = v105.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 11 / 10 + < & x[56,0] x ?"
v105 = v105.expr(exp, exp, exp)

#v105_m = v105.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v105o = v105
v105 = v105.convertToRGB32(interlaced=false, matrix="PC.709")
#return v105.interleave(v105_m)#.info
v105 = v105.ExInpaint(mask = v105_m)
v105 = v105.convertToYV24(interlaced=false, matrix="PC.709")

v105wob = v105
v105_mYV = v105_m.convertToYV24(interlaced=false, matrix="PC.709")
v105_mYV = v105_mYV.expr(expM, "x", "x")
v105_m = v105_mYV.gaussResize(v105.width/8, v105.height/8).gaussResize(v105.width, v105.height)
#return v105_mYV.interleave(v105_m)
v105b = v105.gaussResize(v105.width/8, v105.height/8).gaussResize(v105.width, v105.height)
#return v105o.interleave(v105b)
v105 = v105o.mt_merge(v105b, v105_m, luma = true)
#v105 = v105wob.interleave(v105)

v105 = v105.crop(48, 0, -30, -56)#.adjustBorders

va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo
v105 = v105.audioDub(va)

last = v105
prefetch

