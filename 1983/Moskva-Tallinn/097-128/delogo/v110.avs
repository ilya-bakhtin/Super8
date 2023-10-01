import("..\1983-Moskva-Tallinn.avs")

#v110 = v110.deScratch(maxwidth=5, mindif=1)

v110_m = v110.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v110 = v110.convertToRGB32(interlaced=false, matrix="PC.709")

v110 = v110.ExInpaint(mask = v110_m)
v110 = v110.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v110, audio_rate = 48000, channels = 2).killVideo
v110 = v110.audioDub(va)

last = v110
prefetch

