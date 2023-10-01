import("..\1983-Moskva-Tallinn.avs")

#v134 = v134.deScratch(maxwidth=5, mindif=1)

v134_m = v134.PrepareMask(mask_w = 120, mask_h = 120)#(mask_tolerance = 200)

v134 = v134.ConvertToPlanarRGB(interlaced=false, matrix="PC.709")
v134 = v134.expr("sx 200 < sy 32 < & x 160 < & x[0,32] x ?", "sx 200 < sy 32 < & x 160 < & x[0,32] x ?", "sx 200 < sy 32 < & x 160 < & x[0,32] x ?")
v134 = v134.convertToRGB32

v134 = v134.ExInpaint(mask = v134_m)
v134 = v134.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v134, audio_rate = 48000, channels = 2).killVideo
v134 = v134.audioDub(va)

last = v134
prefetch

