import("..\1983-Moskva-Tallinn.avs")

#v113 = v113.deScratch(maxwidth=5, mindif=1)

v113_m = v113.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v113 = v113.convertToRGB32(interlaced=false, matrix="PC.709")

v113 = v113.ExInpaint(mask = v113_m)
v113 = v113.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v113, audio_rate = 48000, channels = 2).killVideo
v113 = v113.audioDub(va)

last = v113
prefetch

