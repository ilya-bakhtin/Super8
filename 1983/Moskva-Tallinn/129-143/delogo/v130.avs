import("..\1983-Moskva-Tallinn.avs")

#v130 = v130.deScratch(maxwidth=5, mindif=1)

v130_m = v130.PrepareMask(mask_w = 120, mask_h = 120)#(mask_tolerance = 200)

v130 = v130.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
#v130 = v130.expr("sx 200 < sy 32 < & x[0,32] x ?", "sx 200 < sy 32 < & x[0,32] x ?", "sx 200 < sy 32 < & x[0,32] x ?")
exp = "sx 250 < sy 32 < & x 160 < & x[0,32] x ?"
v130 = v130.expr(exp, exp, exp)
v130 = v130.convertToRGB32

v130 = v130.ExInpaint(mask = v130_m)
v130 = v130.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v130, audio_rate = 48000, channels = 2).killVideo
v130 = v130.audioDub(va)

last = v130
prefetch

