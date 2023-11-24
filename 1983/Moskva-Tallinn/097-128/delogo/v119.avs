import("..\1983-Moskva-Tallinn.avs")

exp = "130 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v119_m = v119.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 4
expY  = "sx 950 < sy 950 sx - 14 / 10 + < & sx 238 < x[0,65] sx 475 < x[-110,62] sx 475 238 + < x[-64,36] x[-32,18] ? ? ? x ?"
expY1 = "sx 950 < sy 950 sx - 14 / 10 + < & sx 238 < x[0,65] sx 475 < x[-110,62] sx 475 238 + < x[-64,36] x[0,18] ? ? ? x ?"
expY2 = "sx 950 < sy 950 sx - 14 / 10 + < & sx 238 < x[0,65] sx 475 < x[-110,62] sx 475 238 + < x[0,36] x[0,18] ? ? ? x ?"
expM = "sx 950 < sy 950 sx - 14 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 14 / 30 + < & 255 0 ?"
expY3 = "sx 950 < sy 950 sx - 14 / 10 + < & x[0,65] x ?"
v119 = v119.trim(0, 40).expr(expY, expY, expY) +\
       v119.trim(41, 54).expr(expY1, expY1, expY1) +\
       v119.trim(55, 59).expr(expY2, expY2, expY2) +\
       v119.trim(60, 0).expr(expY3, expY3, expY3)
exp = "sy 680 < width sx - 680 sy - 14 / 10 + < & x[-44,0] x ?"
v119 = v119.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 14 / 10 + < & x[0,-65] x ?"
v119 = v119.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 14 / 10 + < & x[44,0] x ?"
v119 = v119.expr(exp, exp, exp)

#v119_m = v119.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v119o = v119
v119 = v119.convertToRGB32(interlaced=false, matrix="PC.709")
#return v119.interleave(v119_m)#.info
v119 = v119.ExInpaint(mask = v119_m)
v119 = v119.convertToYV24(interlaced=false, matrix="PC.709")

v119wob = v119
v119_mYV = v119_m.convertToYV24(interlaced=false, matrix="PC.709")
v119_mYV = v119_mYV.extractY.expr(expM).convertToYV24
v119_m = v119_mYV.gaussResize(v119.width/16, v119.height/16).gaussResize(v119.width, v119.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v119_mYV.interleave(v119_m)
v119b = v119.gaussResize(v119.width/32, v119.height/32).gaussResize(v119.width, v119.height)
#return v119o.interleave(v119b)
v119 = v119o.mt_merge(v119b, v119_m, luma = true)
/*
# 129 -> 130..138
v119_mYV = v119_mYV.extractY.expr(expMt).convertToYV24
v119_m = v119_mYV.gaussResize(v119.width/16, v119.height/16).gaussResize(v119.width, v119.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v119_m.histogram
v119_129 = v119.trim(129, -1)
v119 = v119.trim(0, 129) + v119.trim(130, 138).mt_merge(v119_129.loop(0, 10), v119_m, luma = true) + v119.trim(139, 0)
*/
#v119 = v119wob.interleave(v119)

v119 = v119.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v119, audio_rate = 48000, channels = 2).killVideo
v119 = v119.audioDub(va)

last = v119
prefetch

