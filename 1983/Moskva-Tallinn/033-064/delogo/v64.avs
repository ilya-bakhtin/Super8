SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 150 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v64_m = v64.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] 1.03 * x ?"
expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,88] x ?"
v64 = v64.expr(v64, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v64 = v64.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v64 = v64.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v64 = v64.expr(exp, exp, exp)

#v64_m = v64.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v64o = v64
v64 = v64.convertToRGB32(interlaced=false, matrix="PC.709")
#return v64.interleave(v64_m)#.info
v64 = v64.ExInpaint(mask = v64_m)
v64 = v64.convertToYV24(interlaced=false, matrix="PC.709")

v64wob = v64
v64_mYV = v64_m.convertToYV24(interlaced=false, matrix="PC.709")
v64_mYV = v64_mYV.expr(expM, "x", "x")
v64_m = v64_mYV.gaussResize(v64.width/16, v64.height/16).gaussResize(v64.width, v64.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v64_mYV.interleave(v64_m)
v64b = v64.gaussResize(v64.width/8, v64.height/8).gaussResize(v64.width, v64.height)
#return v64o.interleave(v64b)
v64 = v64o.mt_merge(v64b, v64_m, luma = true)
#v64 = v64wob.interleave(v64)

v64 = v64.crop(80, 0, 0, -56)#.adjustBorders

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

last = v64
prefetch

