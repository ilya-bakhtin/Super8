import("..\1983-Moskva-Tallinn.avs")

#v116 = v116.deScratch(maxwidth=5, mindif=1)

v116_m = v116.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")

v116 = v116.ExInpaint(mask = v116_m)
v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v116, audio_rate = 48000, channels = 2).killVideo
v116 = v116.audioDub(va)

last = v116
prefetch

