import("..\1983-Moskva-Tallinn.avs")

#v102 = v102.deScratch(maxwidth=5, mindif=1)

v102_m = v102.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v102 = v102.convertToRGB32(interlaced=false, matrix="PC.709")

v102 = v102.ExInpaint(mask = v102_m)
v102 = v102.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo
v102 = v102.audioDub(va)

last = v102
prefetch

