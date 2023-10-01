import("..\1983-Moskva-Tallinn.avs")

#v138 = v138.deScratch(maxwidth=5, mindif=1)

v138_m = v138.PrepareMask(mask_w = 140, mask_h = 140)#(mask_tolerance = 200)

v138 = v138.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
exp = "sx 250 < sy 50 < & x 160 < & x[0,50] x ?"
v138 = v138.expr(exp, exp, exp)
v138 = v138.convertToRGB32

v138 = v138.ExInpaint(mask = v138_m)
v138 = v138.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v138, audio_rate = 48000, channels = 2).killVideo
v138 = v138.audioDub(va)

last = v138
prefetch

