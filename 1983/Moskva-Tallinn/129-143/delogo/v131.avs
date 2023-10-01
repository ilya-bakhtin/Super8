import("..\1983-Moskva-Tallinn.avs")

#v131 = v131.deScratch(maxwidth=5, mindif=1)

v131_m = v131.PrepareMask(mask_w = 120, mask_h = 120)#(mask_tolerance = 200)

v131 = v131.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
#v131 = v131.expr("sx 200 < sy 32 < & x[0,32] x ?", "sx 200 < sy 32 < & x[0,32] x ?", "sx 200 < sy 32 < & x[0,32] x ?")
exp = "sx 250 < sy 32 < & x 160 < & x[0,32] x ?"
v131 = v131.expr(exp, exp, exp)
v131 = v131.convertToRGB32

v131 = v131.ExInpaint(mask = v131_m)
v131 = v131.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v131, audio_rate = 48000, channels = 2).killVideo
v131 = v131.audioDub(va)

last = v131
prefetch

