SetFilterMTMode("Deshaker", MT_SERIALIZED)
import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v17_m = v17.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4.
expY = "sx 950 < sy 950 sx - 14 / 0 + < & x[0,65] x ?"
expM = "sx 950 < sy 950 sx - 14 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 14 / 0 + < & x[0,65] x ?"
v17 = v17.expr(expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v17 = v17.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v17 = v17.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v17 = v17.expr(exp, exp, exp)

#v17_m = v17.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v17o = v17
v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")
#return v17.interleave(v17_m)#.info
v17 = v17.ExInpaint(mask = v17_m)
v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")

v17wob = v17
v17_mYV = v17_m.convertToYV24(interlaced=false, matrix="PC.709")
v17_mYV = v17_mYV.extractY.expr(expM).convertToYV24
v17_m = v17_mYV.gaussResize(v17.width/8, v17.height/8).gaussResize(v17.width, v17.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v17_mYV.interleave(v17_m)
v17b = v17.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)
#return v17o.interleave(v17b)
v17 = v17o.mt_merge(v17b, v17_m, luma = true)
/*
# 129 -> 130..138
v17_mYV = v17_mYV.extractY.expr(expMt).convertToYV24
v17_m = v17_mYV.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v17_m.histogram
v17_129 = v17.trim(129, -1)
v17 = v17.trim(0, 129) + v17.trim(130, 138).mt_merge(v17_129.loop(0, 10), v17_m, luma = true) + v17.trim(139, 0)
*/
#v17 = v17wob.interleave(v17)

v17 = v17.crop(0, 0, -78, -56)#.adjustBorders

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

last = v17
prefetch

