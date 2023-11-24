SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v79_m = v79.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.5
#expY = "sx 950 < sy 950 sx - 12 / 0 + < & x[0,74] x ?"
expY = "sx 950 < sy 950 sx - 12 / 0 + < & x[50,64] x ?"
expM = "sx 950 < sy 950 sx - 12 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 12 / 10 + < & 255 0 ?"
expC = expY
v79 = v79.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 12 / 10 + < & x[-52,0] x ?"
v79 = v79.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 12 / 10 + < & x[0,-74] x ?"
v79 = v79.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 12 / 10 + < & x[52,0] x ?"
v79 = v79.expr(exp, exp, exp)

#v79_m = v79.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v79o = v79
v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")
#return v79.interleave(v79_m)#.info
v79 = v79.ExInpaint(mask = v79_m)
v79 = v79.convertToYV24(interlaced=false, matrix="PC.709")

v79wob = v79
v79_mYV = v79_m.convertToYV24(interlaced=false, matrix="PC.709")
v79_mYV = v79_mYV.extractY.expr(expM).convertToYV24
v79_m = v79_mYV.gaussResize(v79.width/8, v79.height/8).gaussResize(v79.width, v79.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v79_mYV.interleave(v79_m)
v79b = v79.gaussResize(v79.width/32, v79.height/32).gaussResize(v79.width, v79.height)
#return v79o.interleave(v79b)
v79 = v79o.mt_merge(v79b, v79_m, luma = true)

# 97 -> 74..96
v79_mYV = v79_mYV.extractY.expr(expMt).convertToYV24
v79_m = v79_mYV.gaussResize(v79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
#return v79_m.histogram
v79_97 = v79.trim(97, -1)
v79 = v79.trim(0, 73) + v79.trim(74, 96).mt_merge(v79_97.loop(20), v79_m, luma = true) + v79.trim(97, 0)

#v79 = v79wob.interleave(v79)

v79 = v79.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

last = v79
prefetch

