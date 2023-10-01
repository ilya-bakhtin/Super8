import("..\1983-Moskva-Tallinn.avs")

#v123 = v123.deScratch(maxwidth=5, mindif=1)

v123_m = v123.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v123 = v123.convertToRGB32(interlaced=false, matrix="PC.709")

v123 = v123.ExInpaint(mask = v123_m)
v123 = v123.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v123, audio_rate = 48000, channels = 2).killVideo
v123 = v123.audioDub(va)

last = v123
prefetch

