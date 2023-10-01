import("..\1983-Moskva-Tallinn.avs")

#v140 = v140.deScratch(maxwidth=5, mindif=1)

v140_m = v140.PrepareMask(mask_w = 140, mask_h = 140)#(mask_tolerance = 200)

v140 = v140.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 250 < sy 20 < & x 160 < & x[0,20] x ?"
v140 = v140.expr(exp, exp, exp)
v140 = v140.convertToRGB32

v140 = v140.ExInpaint(mask = v140_m)
v140 = v140.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v140, audio_rate = 48000, channels = 2).killVideo
v140 = v140.audioDub(va)

last = v140
prefetch

