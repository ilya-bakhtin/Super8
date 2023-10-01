import("..\1983-Moskva-Tallinn.avs")

#v126 = v126.deScratch(maxwidth=5, mindif=1)

v126_m = v126.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v126 = v126.convertToRGB32(interlaced=false, matrix="PC.709")

v126 = v126.ExInpaint(mask = v126_m)
v126 = v126.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v126, audio_rate = 48000, channels = 2).killVideo
v126 = v126.audioDub(va)

last = v126
prefetch

