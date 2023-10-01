import("..\1983-Moskva-Tallinn.avs")

#v109 = v109.deScratch(maxwidth=5, mindif=1)

v109_m = v109.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v109 = v109.convertToRGB32(interlaced=false, matrix="PC.709")

v109 = v109.ExInpaint(mask = v109_m)
v109 = v109.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v109, audio_rate = 48000, channels = 2).killVideo
v109 = v109.audioDub(va)

last = v109
prefetch

