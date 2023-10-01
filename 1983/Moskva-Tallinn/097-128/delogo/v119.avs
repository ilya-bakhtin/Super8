import("..\1983-Moskva-Tallinn.avs")

#v119 = v119.deScratch(maxwidth=5, mindif=1)

v119_m = v119.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v119 = v119.convertToRGB32(interlaced=false, matrix="PC.709")

v119 = v119.ExInpaint(mask = v119_m)
v119 = v119.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v119, audio_rate = 48000, channels = 2).killVideo
v119 = v119.audioDub(va)

last = v119
prefetch

