import("..\1983-Moskva-Tallinn.avs")

#v142_m = v142.PrepareMask(mask_w = 170, mask_h = 100, dw1 = 30, dh1 = 10, mask_tolerance = 200)
exp = "160 mw^ 110 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v142_m = v142.trim(0, -1).extractY.expr(exp).convertToYV24
#return v142.interleave(v142_m)

v142b = v142#.convertToRGB32(interlaced=false, matrix="PC.709")

exp = "x[10,110]"
#v142b = v142b.ExInpaint(mask = v142_m)
v142b = v142b.expr(exp, exp, exp)
v142b = v142b.gaussResize(v142.width/16, v142.height/16).gaussResize(v142.width, v142.height)

#v142b = v142b.convertToYV24(interlaced=false, matrix="PC.709")

v142_m = v142_m.convertToYV24(interlaced=false, matrix="PC.709")
v142_m = v142_m.gaussResize(v142.width/16, v142.height/16).gaussResize(v142.width, v142.height)
#return v142.interleave(v142_m).prefetch
v142 = v142.mt_merge(v142b, v142_m, luma = true)

#v142 = v142.crop(78, 0, 0, -56)

va = BlankClip(v142, audio_rate = 48000, channels = 2).killVideo
v142 = v142.audioDub(va)

last = v142
prefetch

