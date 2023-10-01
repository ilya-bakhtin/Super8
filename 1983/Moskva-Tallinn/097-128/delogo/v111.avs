import("..\1983-Moskva-Tallinn.avs")

#v111 = v111.deScratch(maxwidth=5, mindif=1)

v111_m = v111.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v111 = v111.convertToRGB32(interlaced=false, matrix="PC.709")

v111 = v111.ExInpaint(mask = v111_m)
v111 = v111.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v111, audio_rate = 48000, channels = 2).killVideo
v111 = v111.audioDub(va)

last = v111
prefetch

