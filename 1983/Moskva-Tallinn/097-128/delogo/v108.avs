import("..\1983-Moskva-Tallinn.avs")

#v108 = v108.deScratch(maxwidth=5, mindif=1)

v108_m = v108.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v108 = v108.convertToRGB32(interlaced=false, matrix="PC.709")

v108 = v108.ExInpaint(mask = v108_m)
v108 = v108.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v108, audio_rate = 48000, channels = 2).killVideo
v108 = v108.audioDub(va)

last = v108
prefetch

