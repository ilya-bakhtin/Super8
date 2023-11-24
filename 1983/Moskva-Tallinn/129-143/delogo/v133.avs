import("..\1983-Moskva-Tallinn.avs")

#v133_m = v133.PrepareMask(mask_w = 170, mask_h = 100, dw1 = 30, dh1 = 10, mask_tolerance = 200)
exp = "170 mw^ 110 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v133_m = v133.trim(0, -1).extractY.expr(exp).convertToYV24
#return v133.interleave(v133_m)

v133b = v133#.convertToRGB32(interlaced=false, matrix="PC.709")

exp = "x[180,120]"
#v133b = v133b.ExInpaint(mask = v133_m)
v133b = v133b.expr(exp, exp, exp)
v133b = v133b.gaussResize(v133.width/16, v133.height/16).gaussResize(v133.width, v133.height)

#v133b = v133b.convertToYV24(interlaced=false, matrix="PC.709")

v133_m = v133_m.convertToYV24(interlaced=false, matrix="PC.709")
v133_m = v133_m.gaussResize(v133.width/16, v133.height/16).gaussResize(v133.width, v133.height)
#return v133b.interleave(v133_m).prefetch
v133 = v133.mt_merge(v133b, v133_m, luma = true)

#v133 = v133.crop(78, 0, 0, -56)

va = BlankClip(v133, audio_rate = 48000, channels = 2).killVideo
v133 = v133.audioDub(va)

last = v133
prefetch

