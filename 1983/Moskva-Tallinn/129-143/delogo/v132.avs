import("..\1983-Moskva-Tallinn.avs")

v132_m = v132.PrepareMask(mask_w = 170, mask_h = 100, dw1 = 30, dh1 = 10, mask_tolerance = 200)
exp = "180 mw^ 110 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v132_m = v132.trim(0, -1).extractY.expr(exp).convertToYV24
#return v132.interleave(v132_m)

v132b = v132#.convertToRGB32(interlaced=false, matrix="PC.709")

#v132b = v132b.ExInpaint(mask = v132_m)
exp = "x[150,40]"
v132b = v132b.expr(exp, exp, exp)
v132b = v132b.gaussResize(v132.width/16, v132.height/16).gaussResize(v132.width, v132.height)

#v132b = v132b.convertToYV24(interlaced=false, matrix="PC.709")

v132_m = v132_m.convertToYV24(interlaced=false, matrix="PC.709")
v132_m = v132_m.gaussResize(v132.width/16, v132.height/16).gaussResize(v132.width, v132.height)
#return v132b.interleave(v132_m).prefetch
v132 = v132.mt_merge(v132b, v132_m, luma = true)

va = BlankClip(v132, audio_rate = 48000, channels = 2).killVideo
v132 = v132.audioDub(va)

last = v132
prefetch

