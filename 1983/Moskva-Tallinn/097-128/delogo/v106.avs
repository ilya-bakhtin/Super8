import("..\1983-Moskva-Tallinn.avs")

#v106 = v106.deScratch(maxwidth=5, mindif=1)

v106_m = v106.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v106 = v106.convertToRGB32(interlaced=false, matrix="PC.709")

v106 = v106.ExInpaint(mask = v106_m)
v106 = v106.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v106, audio_rate = 48000, channels = 2).killVideo
v106 = v106.audioDub(va)

last = v106
prefetch

