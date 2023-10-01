import("..\1983-Moskva-Tallinn.avs")

#v100 = v100.deScratch(maxwidth=5, mindif=1)

v100_m = v100.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v100 = v100.convertToRGB32(interlaced=false, matrix="PC.709")

v100 = v100.ExInpaint(mask = v100_m)
v100 = v100.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

last = v100
prefetch

