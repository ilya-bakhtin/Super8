import("..\1983-Moskva-Tallinn.avs")

#v97 = v97.deScratch(maxwidth=5, mindif=1)

v97_m = v97.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v97 = v97.convertToRGB32(interlaced=false, matrix="PC.709")

v97 = v97.ExInpaint(mask = v97_m)
v97 = v97.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v97, audio_rate = 48000, channels = 2).killVideo
v97 = v97.audioDub(va)

last = v97
prefetch

