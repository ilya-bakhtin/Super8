SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v47_m = v47.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.9
expY = "sx 950 < sy 950 sx - 15 / 0 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 15 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 15 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 15 / 0 + < & x[0,65] x ?"
v47 = v47.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 15 / 10 + < & x[-44,0] x ?"
v47 = v47.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 15 / 10 + < & x[0,-65] x ?"
v47 = v47.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 15 / 10 + < & x[44,0] x ?"
v47 = v47.expr(exp, exp, exp)

#v47_m = v47.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v47o = v47
v47 = v47.convertToRGB32(interlaced=false, matrix="PC.709")
#return v47.interleave(v47_m)#.info
v47 = v47.ExInpaint(mask = v47_m)
v47 = v47.convertToYV24(interlaced=false, matrix="PC.709")

v47wob = v47
v47_mYV = v47_m.convertToYV24(interlaced=false, matrix="PC.709")
v47_mYV = v47_mYV.extractY.expr(expM).convertToYV24
v47_m = v47_mYV.gaussResize(v47.width/8, v47.height/8).gaussResize(v47.width, v47.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v47_mYV.interleave(v47_m)
v47b = v47.gaussResize(v47.width/16, v47.height/16).gaussResize(v47.width, v47.height)
#return v47o.interleave(v47b)
v47 = v47o.mt_merge(v47b, v47_m, luma = true)
/*
# 129 -> 130..138
v47_mYV = v47_mYV.extractY.expr(expMt).convertToYV24
v47_m = v47_mYV.gaussResize(v47.width/16, v47.height/16).gaussResize(v47.width, v47.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v47_m.histogram
v47_129 = v47.trim(129, -1)
v47 = v47.trim(0, 129) + v47.trim(130, 138).mt_merge(v47_129.loop(0, 10), v47_m, luma = true) + v47.trim(139, 0)
*/
#v47 = v47wob.interleave(v47)

v47 = v47.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v47, audio_rate = 48000, channels = 2).killVideo
v47 = v47.audioDub(va)

last = v47
prefetch

