import("..\1983-Moskva-Tallinn.avs")

exp = "150 mw^ 180 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v126_m = v126.trim(0, -1).extractY.expr(exp).convertToRGB32

# slope 3.5
expY = "sx 950 < sy 950 sx - 16 / 00 + < & x[0,58] x ?"
expM = "sx 950 < sy 950 sx - 16 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 16 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 16 / 00 + < & x[0,58] x ?"
v126 = v126.expr(v126, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 16 / 10 + < & x[-40,0] x ?"
v126 = v126.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 16 / 10 + < & x[0,-58] x ?"
v126 = v126.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 16 / 10 + < & x[40,0] x ?"
v126 = v126.expr(exp, exp, exp)

#v126_m = v126.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v126o = v126
v126 = v126.convertToRGB32(interlaced=false, matrix="PC.709")
#return v126.interleave(v126_m)#.info
v126 = v126.ExInpaint(mask = v126_m)
v126 = v126.convertToYV24(interlaced=false, matrix="PC.709")

v126wob = v126
v126_mYV = v126_m.convertToYV24(interlaced=false, matrix="PC.709")
v126_mYV = v126_mYV.extractY.expr(expM).convertToYV24
v126_m = v126_mYV.gaussResize(v126.width/8, v126.height/8).gaussResize(v126.width, v126.height)
#return v126_mYV.interleave(v126_m)
v126b = v126.gaussResize(v126.width/16, v126.height/16).gaussResize(v126.width, v126.height)
#return v126o.interleave(v126b)
v126 = v126o.mt_merge(v126b, v126_m, luma = true)

# 50 -> 28..49
v126_mYV = v126_mYV.extractY.expr(expMt).convertToYV24
v126_m = v126_mYV.gaussResize(v126.width/16, v126.height/16).gaussResize(v126.width, v126.height)
#return v126_m.histogram
v126_50 = v126.trim(50, -1)
v126 = v126.trim(0, 27) + v126.trim(28, 49).mt_merge(v126_50.loop(30), v126_m, luma = true) + v126.trim(50, 0)

#v126 = v126wob.interleave(v126)

v126 = v126.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v126, audio_rate = 48000, channels = 2).killVideo
v126 = v126.audioDub(va)

last = v126
prefetch

