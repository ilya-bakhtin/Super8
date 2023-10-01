import("..\1983-Moskva-Tallinn.avs")

#v121 = v121.deScratch(maxwidth=5, mindif=1)

v121_m = v121.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v121 = v121.convertToRGB32(interlaced=false, matrix="PC.709")

v121 = v121.ExInpaint(mask = v121_m)
v121 = v121.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

last = v121
prefetch

