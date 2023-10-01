import("..\1983-Moskva-Tallinn.avs")

#v125 = v125.deScratch(maxwidth=5, mindif=1)

v125_m = v125.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v125 = v125.convertToRGB32(interlaced=false, matrix="PC.709")

v125 = v125.ExInpaint(mask = v125_m)
v125 = v125.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v125, audio_rate = 48000, channels = 2).killVideo
v125 = v125.audioDub(va)

last = v125
prefetch

