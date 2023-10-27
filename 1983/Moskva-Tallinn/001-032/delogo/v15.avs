SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v15_m = v15.PrepareMask#(mask_tolerance = 200)
#v15 = v15.convertToRGB32(interlaced=false, matrix="PC.709")
#v15 = v15.ExInpaint(mask = v15_m)
#v15 = v15.convertToYV24(interlaced=false, matrix="PC.709")
exp = "sx 500 < sy 500 sx - 8 / < & x 250 < & x[0,50] 1.02 * x ?"
v15 = v15.expr(exp, exp, exp)
exp = "sy 420 < width sx - 420 sy - 8 / < & x 250 < & x[-50,0] 1.02 * x ?"
v15 = v15.expr(exp, exp, exp)


va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

last = v15
prefetch

