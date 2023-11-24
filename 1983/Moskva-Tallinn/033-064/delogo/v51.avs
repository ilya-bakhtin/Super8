SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")
/*
exp = "100 mw^ 240 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v51_m = v51.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 8
expY = "sx 950 < sy 950 sx - 7 / 10 + < & x[0,130] 1.03 * x ?"
expM = "sx 950 < sy 950 sx - 7 / 10 + < & 255 x ?"
expC = "sx 950 < sy 950 sx - 7 / 10 + < & x[0,130] x ?"
v51 = v51.expr(v51, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 7 / 10 + < & x[-90,0] x ?"
# sy < 680 && (width - sx) < (680 - sy) / 12
v51 = v51.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 7 / 10 + < & x[0,-130] x ?"
# width - sx < 950 && height - sy < (950 - (width - sx)) / 12
v51 = v51.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 7 / < & x[90,0] x ?"
v51 = v51.expr(exp, exp, exp)
*/
v51_m = v51.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v51o = v51
v51 = v51.convertToRGB32(interlaced=false, matrix="PC.709")
#return v51.interleave(v51_m)#.info
v51 = v51.ExInpaint(mask = v51_m)
v51 = v51.convertToYV24(interlaced=false, matrix="PC.709")
/*
v51wob = v51
v51_mYV = v51_m.convertToYV24(interlaced=false, matrix="PC.709")
#v51_mYV = v51_mYV.expr(expM, "x", "x")
v51_m = v51_mYV.gaussResize(v51.width/16, v51.height/16).gaussResize(v51.width, v51.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v51_mYV.interleave(v51_m)
v51b = v51.gaussResize(v51.width/4, v51.height/4).gaussResize(v51.width, v51.height)
v51 = v51o.mt_merge(v51b, v51_m, luma = true)
#v51 = v51wob.interleave(v51)
*/
va = BlankClip(v51, audio_rate = 48000, channels = 2).killVideo
v51 = v51.audioDub(va)

last = v51
prefetch

