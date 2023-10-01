import("..\1983-Moskva-Tallinn.avs")

#v112 = v112.deScratch(maxwidth=5, mindif=1)

v112_m = v112.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v112 = v112.convertToRGB32(interlaced=false, matrix="PC.709")

v112 = v112.ExInpaint(mask = v112_m)
v112 = v112.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

last = v112
prefetch

