SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

v54 = v55 # v54 is a placeholder for slope 3.5 version
exp = "120 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v54_m = v54.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.5
expY = "sx 950 < sy 950 sx - 17 / 00 + < & x[0,58] x ?"
expM = "sx 950 < sy 950 sx - 17 / 10 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 17 / 00 + < & x[0,58] x ?"
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
v54_m = v54_mYV.gaussResize(v54.width/8, v54.height/8).gaussResize(v54.width, v54.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v54_mYV.interleave(v54_m)
v54b = v54.gaussResize(v54.width/8, v54.height/8).gaussResize(v54.width, v54.height)
#return v54o.interleave(v54b)
v54 = v54o.mt_merge(v54b, v54_m, luma = true)
#v54 = v54wob.interleave(v54)

#####

exp = "130 mw^ 190 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v55_m = v55.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 5
expY = "sx 950 < sy 950 sx - 11 / 00 + < & x[0,80] x ?"
expM = "sx 950 < sy 950 sx - 11 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 11 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 11 / 00 + < & x[0,80] x ?"
v55 = v55.expr(v55, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 11 / 10 + < & x[-60,0] x ?"
v55 = v55.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 11 / 10 + < & x[0,-80] x ?"
v55 = v55.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 11 / 10 + < & x[60,0] x ?"
v55 = v55.expr(exp, exp, exp)

#v55_m = v55.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v55o = v55
v55 = v55.convertToRGB32(interlaced=false, matrix="PC.709")
#eturn v55.intereave(v55_m)#.info
v55 = v55.ExInpaint(mask = v55_m)
v55 = v55.convertToYV24(interlaced=false, matrix="PC.709")

v55wob = v55
v55_mYV = v55_m.convertToYV24(interlaced=false, matrix="PC.709")
v55_mYV = v55_mYV.expr(expM, "x", "x")
v55_m = v55_mYV.gaussResize(v55.width/8, v55.height/8).gaussResize(v55.width, v55.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v55_mYV.interleave(v55_m)
v55b = v55.gaussResize(v55.width/32, v55.height/32).gaussResize(v55.width, v55.height)
#return v55o.interleave(v55b)
v55 = v55o.mt_merge(v55b, v55_m, luma = true)
#v55 = v55wob.interleave(v55)
v55 = v54.trim(0, 73) + v55.trim(74, 0)

# 133 -> 120..132
v55_mYV = v55_mYV.extractY.expr(expMt).convertToYV24
v55_m = v55_mYV.gaussResize(v55.width/8, v55.height/8).gaussResize(v55.width, v55.height)
#return v55_m.histogram
v55_133 = v55.trim(133, -1)
v55 = v55.trim(0, 119) + v55.trim(120, 132).mt_merge(v55_133.loop(20), v55_m, luma = true) + v55.trim(133, 0)

v55 = v55.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

last = v55
prefetch

