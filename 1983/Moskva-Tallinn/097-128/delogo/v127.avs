import("..\1983-Moskva-Tallinn.avs")

#v127 = v127.deScratch(maxwidth=5, mindif=1)

v127_m = v127.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v127 = v127.convertToRGB32(interlaced=false, matrix="PC.709")

v127 = v127.ExInpaint(mask = v127_m)
v127 = v127.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v127, audio_rate = 48000, channels = 2).killVideo
v127 = v127.audioDub(va)

last = v127
prefetch

