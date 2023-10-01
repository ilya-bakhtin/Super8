import("..\1983-Moskva-Tallinn.avs")

#v135 = v135.deScratch(maxwidth=5, mindif=1)

v135_m = v135.PrepareMask(mask_w = 120, mask_h = 120)#(mask_tolerance = 200)

v135 = v135.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
v135 = v135.expr("sx 200 < sy 32 < & x 160 < & x[0,32] x ?", "sx 200 < sy 32 < & x 160 < & x[0,32] x ?", "sx 200 < sy 32 < & x 160 < & x[0,32] x ?")
v135 = v135.convertToRGB32

v135 = v135.ExInpaint(mask = v135_m)
v135 = v135.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v135, audio_rate = 48000, channels = 2).killVideo
v135 = v135.audioDub(va)

last = v135
prefetch

