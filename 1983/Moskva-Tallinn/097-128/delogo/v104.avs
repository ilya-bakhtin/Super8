import("..\1983-Moskva-Tallinn.avs")

#v104 = v104.deScratch(maxwidth=5, mindif=1)

v104_m = v104.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v104 = v104.convertToRGB32(interlaced=false, matrix="PC.709")

v104 = v104.ExInpaint(mask = v104_m)
v104 = v104.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v104, audio_rate = 48000, channels = 2).killVideo
v104 = v104.audioDub(va)

last = v104
prefetch

