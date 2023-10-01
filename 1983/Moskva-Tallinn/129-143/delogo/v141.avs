import("..\1983-Moskva-Tallinn.avs")

#v141 = v141.deScratch(maxwidth=5, mindif=1)

v141_m = v141.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v141 = v141.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 250 < sy 20 < & x 160 < & x[0,20] x ?"
v141 = v141.expr(exp, exp, exp)
v141 = v141.convertToRGB32

v141 = v141.ExInpaint(mask = v141_m)
v141 = v141.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v141, audio_rate = 48000, channels = 2).killVideo
v141 = v141.audioDub(va)

last = v141
prefetch

