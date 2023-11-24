SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v4_m = v4.PrepareMask(mask_w = 170, mask_h = 100, dw1 = 30, dh1 = 10, mask_tolerance = 200)
exp = "140 mw^ 110 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
v4_m = v4.trim(0, -1).extractY.expr(exp).convertToYV24
#return v4.interleave(v4_m)

v4b = v4#.convertToRGB32(interlaced=false, matrix="PC.709")

exp = "x[140,10]"
#v4b = v4b.ExInpaint(mask = v4_m)
v4b = v4b.expr(exp, exp, exp)
v4b = v4b.gaussResize(v4.width/16, v4.height/16).gaussResize(v4.width, v4.height)

#v4b = v4b.convertToYV24(interlaced=false, matrix="PC.709")

v4_m = v4_m.convertToYV24(interlaced=false, matrix="PC.709")
v4_m = v4_m.gaussResize(v4.width/16, v4.height/16).gaussResize(v4.width, v4.height)
#return v4.interleave(v4_m).prefetch
v4 = v4.mt_merge(v4b, v4_m, luma = true)

#v4 = v4.crop(78, 0, 0, -56)

va = BlankClip(v4, audio_rate = 48000, channels = 2).killVideo
v4 = v4.audioDub(va)

last = v4
prefetch

