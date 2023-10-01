import("..\1983-Moskva-Tallinn.avs")

#v120 = v120.deScratch(maxwidth=5, mindif=1)

v120_m = v120.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v120 = v120.convertToRGB32(interlaced=false, matrix="PC.709")

v120 = v120.ExInpaint(mask = v120_m)
v120 = v120.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v120, audio_rate = 48000, channels = 2).killVideo
v120 = v120.audioDub(va)

last = v120
prefetch

