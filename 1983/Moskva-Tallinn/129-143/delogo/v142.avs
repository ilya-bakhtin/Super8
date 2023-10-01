import("..\1983-Moskva-Tallinn.avs")

#v142 = v142.deScratch(maxwidth=5, mindif=1)

v142_m = v142.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v142 = v142.convertToRGB32(interlaced=false, matrix="PC.709")

v142 = v142.ExInpaint(mask = v142_m)
v142 = v142.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v142, audio_rate = 48000, channels = 2).killVideo
v142 = v142.audioDub(va)

last = v142
prefetch

