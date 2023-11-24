SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 150 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v68_m = v68.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3
expY = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 10 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
v68 = v68.expr(v68, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v68 = v68.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v68 = v68.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v68 = v68.expr(exp, exp, exp)

#v68_m = v68.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v68o = v68
v68 = v68.convertToRGB32(interlaced=false, matrix="PC.709")
#return v68.interleave(v68_m)#.info
v68 = v68.ExInpaint(mask = v68_m)
v68 = v68.convertToYV24(interlaced=false, matrix="PC.709")

v68wob = v68
v68_mYV = v68_m.convertToYV24(interlaced=false, matrix="PC.709")
v68_mYV = v68_mYV.expr(expM, "x", "x")
v68_m = v68_mYV.gaussResize(v68.width/8, v68.height/8).gaussResize(v68.width, v68.height)
#return v68_mYV.interleave(v68_m)
v68b = v68.gaussResize(v68.width/8, v68.height/8).gaussResize(v68.width, v68.height)
#return v68o.interleave(v68b)
v68 = v68o.mt_merge(v68b, v68_m, luma = true)
#v68 = v68wob.interleave(v68)

v68 = v68.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

last = v68
prefetch

