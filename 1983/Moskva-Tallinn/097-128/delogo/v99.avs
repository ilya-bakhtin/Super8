import("..\1983-Moskva-Tallinn.avs")

#v99 = v99.deScratch(maxwidth=5, mindif=1)

v99_m = v99.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v99 = v99.convertToRGB32(interlaced=false, matrix="PC.709")

v99 = v99.ExInpaint(mask = v99_m)
v99 = v99.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v99, audio_rate = 48000, channels = 2).killVideo
v99 = v99.audioDub(va)

last = v99
prefetch

