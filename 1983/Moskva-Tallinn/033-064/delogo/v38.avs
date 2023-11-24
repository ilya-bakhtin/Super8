SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v38_m = v38.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.
expY = "sx 950 < sy 950 sx - 14 / 0 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 14 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 14 / 0 + < & x[0,65] x ?"
v38 = v38.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v38 = v38.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v38 = v38.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v38 = v38.expr(exp, exp, exp)

#v38_m = v38.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v38o = v38
v38 = v38.convertToRGB32(interlaced=false, matrix="PC.709")
#return v38.interleave(v38_m)#.info
v38 = v38.ExInpaint(mask = v38_m)
v38 = v38.convertToYV24(interlaced=false, matrix="PC.709")

v38wob = v38
v38_mYV = v38_m.convertToYV24(interlaced=false, matrix="PC.709")
v38_mYV = v38_mYV.extractY.expr(expM).convertToYV24
v38_m = v38_mYV.gaussResize(v38.width/8, v38.height/8).gaussResize(v38.width, v38.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v38_mYV.interleave(v38_m)
v38b = v38.gaussResize(v38.width/16, v38.height/16).gaussResize(v38.width, v38.height)
#return v38o.interleave(v38b)
v38 = v38o.mt_merge(v38b, v38_m, luma = true)
/*
# 129 -> 130..138
v38_mYV = v38_mYV.extractY.expr(expMt).convertToYV24
v38_m = v38_mYV.gaussResize(v38.width/16, v38.height/16).gaussResize(v38.width, v38.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v38_m.histogram
v38_129 = v38.trim(129, -1)
v38 = v38.trim(0, 129) + v38.trim(130, 138).mt_merge(v38_129.loop(0, 10), v38_m, luma = true) + v38.trim(139, 0)
*/
#v38 = v38wob.interleave(v38)

v38 = v38.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v38, audio_rate = 48000, channels = 2).killVideo
v38 = v38.audioDub(va)

last = v38
prefetch

