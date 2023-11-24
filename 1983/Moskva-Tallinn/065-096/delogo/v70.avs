SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

exp = "110 mw^ 200 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v70_m = v70.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 6
expY = "sx 950 < sy 950 sx - 9 / 10 + < & sx 600 < x[16,96] x[-40,80] ? x ?"
expM = "sx 950 < sy 950 sx - 9 / 30 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 9 / 10 + < & sx 600 < x[16,96] x[-40,80] ? x ?"
v70 = v70.expr(v70, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 9 / 10 + < & x[-70,0] x ?"
v70 = v70.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 9 / 10 + < & x[0,-96] x ?"
v70 = v70.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 9 / 10 + < & x[70,0] x ?"
v70 = v70.expr(exp, exp, exp)

#v70_m = v70.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v70o = v70
v70 = v70.convertToRGB32(interlaced=false, matrix="PC.709")
#return v70.interleave(v70_m)#.info
v70 = v70.ExInpaint(mask = v70_m)
v70 = v70.convertToYV24(interlaced=false, matrix="PC.709")

v70wob = v70
v70_mYV = v70_m.convertToYV24(interlaced=false, matrix="PC.709")
v70_mYV = v70_mYV.expr(expM, "x", "x")
v70_m = v70_mYV.gaussResize(v70.width/16, v70.height/16).gaussResize(v70.width, v70.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v70_mYV.interleave(v70_m)
v70b = v70.gaussResize(v70.width/8, v70.height/8).gaussResize(v70.width, v70.height)
#return v70o.interleave(v70b)
v70 = v70o.mt_merge(v70b, v70_m, luma = true)
#v70 = v70wob.interleave(v70)

v70 = v70.crop(80, 0, 0, -56)#.adjustBorders

va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

last = v70
prefetch

