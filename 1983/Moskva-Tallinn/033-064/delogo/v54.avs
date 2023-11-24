SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v54_m = v54.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.5
expY = "sx 950 < sy 950 sx - 17 / 10 + < & x[0,58] 1.03 * x ?"
expM = "sx 950 < sy 950 sx - 17 / 30 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 17 / 10 + < & x[0,58] x ?"
v54 = v54.expr(v54, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 20 / 10 + < & x[-40,0] x ?"
v54 = v54.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 17 / 10 + < & x[0,-58] x ?"
v54 = v54.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 17 / 10 + < & x[40,0] x ?"
v54 = v54.expr(exp, exp, exp)

#v54_m = v54.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v54o = v54
v54 = v54.convertToRGB32(interlaced=false, matrix="PC.709")
#return v54.interleave(v54_m)#.info
v54 = v54.ExInpaint(mask = v54_m)
v54 = v54.convertToYV24(interlaced=false, matrix="PC.709")

v54wob = v54
v54_mYV = v54_m.convertToYV24(interlaced=false, matrix="PC.709")
v54_mYV = v54_mYV.expr(expM, "x", "x")
v54_m = v54_mYV.gaussResize(v54.width/16, v54.height/16).gaussResize(v54.width, v54.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v54_mYV.interleave(v54_m)
v54b = v54.gaussResize(v54.width/8, v54.height/8).gaussResize(v54.width, v54.height)
#return v54o.interleave(v54b)
v54 = v54o.mt_merge(v54b, v54_m, luma = true)
#v54 = v54wob.interleave(v54)

#v54 = v54.crop(80, 0, 0, -56)#.adjustBorders

va = BlankClip(v54, audio_rate = 48000, channels = 2).killVideo
v54 = v54.audioDub(va)

last = v54
prefetch

