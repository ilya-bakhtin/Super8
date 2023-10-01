import("..\1983-Moskva-Tallinn.avs")

#v139 = v139.deScratch(maxwidth=5, mindif=1)

v139_m = v139.PrepareMask(mask_w = 140, mask_h = 140)#(mask_tolerance = 200)

v139 = v139.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 250 < sy 20 < & x 160 < & x[0,20] x ?"
v139 = v139.expr(exp, exp, exp)
v139 = v139.convertToRGB32

v139 = v139.ExInpaint(mask = v139_m)
v139 = v139.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v139, audio_rate = 48000, channels = 2).killVideo
v139 = v139.audioDub(va)

last = v139
prefetch

