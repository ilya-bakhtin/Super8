import("..\1983-Moskva-Tallinn.avs")
#return v102.prefetch
exp = "130 mw^ 160 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v102_m = v102.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
### v102 only
exp = "sx 396 > sx 438 < & sy 58 < & x[0,28] x ?"
v102b = v102.expr(exp, exp, exp)
exp = "sx 396 > sx 438 < & sy 58 < & x[36,0] x ?"
v102r = v102.expr(exp, exp, exp)
v102 = v102b.trim(0, 150) + v102r.trim(151, 310) + v102b.trim(311, 339) + v102r.trim(340, 493) + v102b.trim(494, 0)
#return v102.prefetch
###
expY = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
v102 = v102.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v102 = v102.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v102 = v102.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v102 = v102.expr(exp, exp, exp)

#v102_m = v102.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v102o = v102
v102 = v102.convertToRGB32(interlaced=false, matrix="PC.709")
#return v102.interleave(v102_m)#.info
v102 = v102.ExInpaint(mask = v102_m)
v102 = v102.convertToYV24(interlaced=false, matrix="PC.709")

v102wob = v102
v102_mYV = v102_m.convertToYV24(interlaced=false, matrix="PC.709")
v102_mYV = v102_mYV.expr(expM, "x", "x")
v102_m = v102_mYV.gaussResize(v102.width/8, v102.height/8).gaussResize(v102.width, v102.height)
#return v102_mYV.interleave(v102_m)
v102b = v102.gaussResize(v102.width/8, v102.height/8).gaussResize(v102.width, v102.height)
#return v102o.interleave(v102b)
v102 = v102o.mt_merge(v102b, v102_m, luma = true)
#v102 = v102wob.interleave(v102)

# 152 -> 153..159
v102_mYV = v102_mYV.extractY.expr(expMt).convertToYV24
v102_m = v102_mYV.gaussResize(v102.width/8, v102.height/8).gaussResize(v102.width, v102.height)
#return v102_m.histogram
v102_152 = v102.trim(152, -1)
v102 = v102.trim(0, 152) + v102.trim(153, 159).mt_merge(v102_152.loop(20), v102_m, luma = true) + v102.trim(160, 0)

# 205 -> 173..204
v102_205 = v102.trim(205, -1)
v102 = v102.trim(0, 172) + v102.trim(173, 204).mt_merge(v102_205.loop(430), v102_m, luma = true) + v102.trim(205, 0)

v102 = v102.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo
v102 = v102.audioDub(va)

last = v102
prefetch

