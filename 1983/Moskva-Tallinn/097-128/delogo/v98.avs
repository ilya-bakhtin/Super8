import("..\1983-Moskva-Tallinn.avs")

#v98 = v98.deScratch(maxwidth=5, mindif=1)

v98_m = v98.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v98 = v98.convertToRGB32(interlaced=false, matrix="PC.709")

v98 = v98.ExInpaint(mask = v98_m)
v98 = v98.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v98, audio_rate = 48000, channels = 2).killVideo
v98 = v98.audioDub(va)

last = v98
prefetch

