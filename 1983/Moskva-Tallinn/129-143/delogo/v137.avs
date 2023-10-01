import("..\1983-Moskva-Tallinn.avs")

#v137 = v137.deScratch(maxwidth=5, mindif=1)

v137_m = v137.PrepareMask(mask_w = 140, mask_h = 140)#(mask_tolerance = 200)

v137 = v137.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 250 < sy 50 < & x 160 < & x[0,50] x ?"
v137 = v137.expr(exp, exp, exp)
v137 = v137.convertToRGB32

v137 = v137.ExInpaint(mask = v137_m)
v137 = v137.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v137, audio_rate = 48000, channels = 2).killVideo
v137 = v137.audioDub(va)

last = v137
prefetch

