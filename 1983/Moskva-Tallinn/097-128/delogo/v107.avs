import("..\1983-Moskva-Tallinn.avs")

#v107 = v107.deScratch(maxwidth=5, mindif=1)

v107_m = v107.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v107 = v107.convertToRGB32(interlaced=false, matrix="PC.709")

v107 = v107.ExInpaint(mask = v107_m)
v107 = v107.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v107, audio_rate = 48000, channels = 2).killVideo
v107 = v107.audioDub(va)

last = v107
prefetch

