import("..\1983-Moskva-Tallinn.avs")

#v132 = v132.deScratch(maxwidth=5, mindif=1)

v132_m = v132.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v132 = v132.convertToRGB32(interlaced=false, matrix="PC.709")

v132 = v132.ExInpaint(mask = v132_m)
v132 = v132.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v132, audio_rate = 48000, channels = 2).killVideo
v132 = v132.audioDub(va)

last = v132
prefetch

