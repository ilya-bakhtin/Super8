import("..\1983-Moskva-Tallinn.avs")

#v143_m = v143.PrepareMask(mask_w = 170, mask_h = 100, dw1 = 30, dh1 = 10, mask_tolerance = 200)
exp = "160 mw^ 110 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v143_m = v143.trim(0, -1).extractY.expr(exp).convertToYV24
#return v143.interleave(v143_m)

v143b = v143#.convertToRGB32(interlaced=false, matrix="PC.709")

exp = "x[10,110]"
#v143b = v143b.ExInpaint(mask = v143_m)
v143b = v143b.expr(exp, exp, exp)
v143b = v143b.gaussResize(v143.width/16, v143.height/16).gaussResize(v143.width, v143.height)

#v143b = v143b.convertToYV24(interlaced=false, matrix="PC.709")

v143_m = v143_m.convertToYV24(interlaced=false, matrix="PC.709")
v143_m = v143_m.gaussResize(v143.width/16, v143.height/16).gaussResize(v143.width, v143.height)
#return v143.interleave(v143_m).prefetch
v143 = v143.mt_merge(v143b, v143_m, luma = true)

#v143 = v143.crop(78, 0, 0, -56)

va = BlankClip(v143, audio_rate = 48000, channels = 2).killVideo
v143 = v143.audioDub(va)

last = v143
prefetch

