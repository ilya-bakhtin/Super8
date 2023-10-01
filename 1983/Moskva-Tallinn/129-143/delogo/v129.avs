import("..\1983-Moskva-Tallinn.avs")
#return v129.adjustBorders
#v129 = v129.deScratch(maxwidth=5, mindif=1)

v129_m = v129.PrepareMask(mask_w = 120, mask_h = 120)#(mask_tolerance = 200)

v129 = v129.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
#v129 = v129.expr("sx 200 < sy 32 < & x[0,32] x ?", "sx 200 < sy 32 < & x[0,32] x ?", "sx 200 < sy 32 < & x[0,32] x ?")
exp = "sx 250 < sy 20 < & x 160 < & x[0,20] x ?"
v129 = v129.expr(exp, exp, exp)
v129 = v129.convertToRGB32

v129 = v129.ExInpaint(mask = v129_m)
v129 = v129.convertToYV24(interlaced=false, matrix="PC.709")
#v129 = v129_m.convertToYV24.interleave(v129)

va = BlankClip(v129, audio_rate = 48000, channels = 2).killVideo
v129 = v129.audioDub(va)

last = v129
prefetch

