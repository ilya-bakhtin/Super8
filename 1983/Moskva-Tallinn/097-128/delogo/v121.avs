import("..\1983-Moskva-Tallinn.avs")

exp = "140 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v121_m = v121.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.5
expY = "sx 950 < sy 950 sx - 16 / 10 + < & x[0,58] x ?"
expM = "sx 950 < sy 950 sx - 16 / 30 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 16 / 30 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 16 / 10 + < & x[0,58] x ?"
v121 = v121.expr(v121, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 16 / 10 + < & x[-40,0] x ?"
v121 = v121.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 16 / 10 + < & x[0,-58] x ?"
v121 = v121.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 16 / 10 + < & x[40,0] x ?"
v121 = v121.expr(exp, exp, exp)

#v121_m = v121.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v121o = v121
v121 = v121.convertToRGB32(interlaced=false, matrix="PC.709")
#return v121.interleave(v121_m)#.info
v121 = v121.ExInpaint(mask = v121_m)
v121 = v121.convertToYV24(interlaced=false, matrix="PC.709")

v121wob = v121
v121_mYV = v121_m.convertToYV24(interlaced=false, matrix="PC.709")
v121_mYV = v121_mYV.extractY.expr(expM).convertToYV24
v121_m = v121_mYV.gaussResize(v121.width/16, v121.height/16).gaussResize(v121.width, v121.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v121_mYV.interleave(v121_m)
v121b = v121.gaussResize(v121.width/16, v121.height/16).gaussResize(v121.width, v121.height)
#return v121o.interleave(v121b)
v121 = v121o.mt_merge(v121b, v121_m, luma = true)
/*
# 129 -> 130..138
v121_mYV = v121_mYV.extractY.expr(expMt).convertToYV24
v121_m = v121_mYV.gaussResize(v121.width/16, v121.height/16).gaussResize(v121.width, v121.height)#.crop(4, 4, 0, 0).addBorders(0, 0, 4, 4)
#return v121_m.histogram
v121_129 = v121.trim(129, -1)
v121 = v121.trim(0, 129) + v121.trim(130, 138).mt_merge(v121_129.loop(0, 10), v121_m, luma = true) + v121.trim(139, 0)
*/
#v121 = v121wob.interleave(v121)

#v121 = v121.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

last = v121
prefetch

