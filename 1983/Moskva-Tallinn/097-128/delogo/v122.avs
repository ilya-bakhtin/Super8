import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v122_m = v122.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.5
expY = "sx 950 < sy 950 sx - 16 / 00 + < & x[0,58] x ?"
expM = "sx 950 < sy 950 sx - 16 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 16 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 16 / 00 + < & x[0,58] x ?"
v122 = v122.expr(v122, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 16 / 10 + < & x[-40,0] x ?"
v122 = v122.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 16 / 10 + < & x[0,-58] x ?"
v122 = v122.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 16 / 10 + < & x[40,0] x ?"
v122 = v122.expr(exp, exp, exp)

#v122_m = v122.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v122o = v122
v122 = v122.convertToRGB32(interlaced=false, matrix="PC.709")
#return v122.interleave(v122_m)#.info
v122 = v122.ExInpaint(mask = v122_m)
v122 = v122.convertToYV24(interlaced=false, matrix="PC.709")

v122wob = v122
v122_mYV = v122_m.convertToYV24(interlaced=false, matrix="PC.709")
v122_mYV = v122_mYV.extractY.expr(expM).convertToYV24
v122_m = v122_mYV.gaussResize(v122.width/8, v122.height/8).gaussResize(v122.width, v122.height)
#return v122_mYV.interleave(v122_m)
v122b = v122.gaussResize(v122.width/16, v122.height/16).gaussResize(v122.width, v122.height)
#return v122o.interleave(v122b)
v122 = v122o.mt_merge(v122b, v122_m, luma = true)
/*
# 129 -> 130..138
v122_mYV = v122_mYV.extractY.expr(expMt).convertToYV24
v122_m = v122_mYV.gaussResize(v122.width/16, v122.height/16).gaussResize(v122.width, v122.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v122_m.histogram
v122_129 = v122.trim(129, -1)
v122 = v122.trim(0, 129) + v122.trim(130, 138).mt_merge(v122_129.loop(0, 10), v122_m, luma = true) + v122.trim(139, 0)
*/
#v122 = v122wob.interleave(v122)

v122 = v122.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v122, audio_rate = 48000, channels = 2).killVideo
v122 = v122.audioDub(va)

last = v122
prefetch

