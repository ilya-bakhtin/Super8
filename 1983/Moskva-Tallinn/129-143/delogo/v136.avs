import("..\1983-Moskva-Tallinn.avs")

#v136 = v136.deScratch(maxwidth=5, mindif=1)

v136_m = v136.PrepareMask(mask_w = 120, mask_h = 120)#(mask_tolerance = 200)

v136 = v136.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
v136 = v136.expr("sx 200 < sy 32 < & x 160 < & x[0,32] x ?", "sx 200 < sy 32 < & x 160 < & x[0,32] x ?", "sx 200 < sy 32 < & x 160 < & x[0,32] x ?")
v136 = v136.convertToRGB32

v136 = v136.ExInpaint(mask = v136_m)
v136 = v136.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v136, audio_rate = 48000, channels = 2).killVideo
v136 = v136.audioDub(va)

last = v136
prefetch

