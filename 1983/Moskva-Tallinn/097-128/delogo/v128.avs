import("..\1983-Moskva-Tallinn.avs")

#v128 = v128.deScratch(maxwidth=5, mindif=1)

v128_m = v128.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v128 = v128.convertToRGB32(interlaced=false, matrix="PC.709")

v128 = v128.ExInpaint(mask = v128_m)
v128 = v128.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v128, audio_rate = 48000, channels = 2).killVideo
v128 = v128.audioDub(va)

last = v128
prefetch

