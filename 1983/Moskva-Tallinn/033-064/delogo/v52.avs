SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "100 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v52_m = v52.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 5
expY = "sx 950 < sy 950 sx - 12 / 00 + < & x[40,80] x ?"
expM = "sx 950 < sy 950 sx - 12 / 10 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 12 / 00 + < & x[40,80] x ?"
v52 = v52.expr(v52, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 12 / 10 + < & x[-60,0] x ?"
# sy < 680 && (width - sx) < (680 - sy) / 12
v52 = v52.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 12 / 10 + < & x[0,-80] x ?"
# width - sx < 950 && height - sy < (950 - (width - sx)) / 12
v52 = v52.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 12 / < & x[60,0] x ?"
v52 = v52.expr(exp, exp, exp)

#v52_m = v52.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v52o = v52
v52 = v52.convertToRGB32(interlaced=false, matrix="PC.709")
#return v52.interleave(v52_m)#.info
v52 = v52.ExInpaint(mask = v52_m)
v52 = v52.convertToYV24(interlaced=false, matrix="PC.709")

v52wob = v52
v52_mYV = v52_m.convertToYV24(interlaced=false, matrix="PC.709")
v52_mYV = v52_mYV.expr(expM, "x", "x")
v52_m = v52_mYV.gaussResize(v52.width/8, v52.height/8).gaussResize(v52.width, v52.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v52_mYV.interleave(v52_m)
v52b = v52.gaussResize(v52.width/16, v52.height/16).gaussResize(v52.width, v52.height)
#return v52o.interleave(v52b)
v52 = v52o.mt_merge(v52b, v52_m, luma = true)
#v52 = v52wob.interleave(v52)

v52 = v52.crop(80, 0, 0, -56)#.adjustBorders

va = BlankClip(v52, audio_rate = 48000, channels = 2).killVideo
v52 = v52.audioDub(va)

last = v52
prefetch

