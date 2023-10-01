import("..\1983-Moskva-Tallinn.avs")

#v143 = v143.deScratch(maxwidth=5, mindif=1)

v143_m = v143.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v143 = v143.convertToRGB32(interlaced=false, matrix="PC.709")

v143 = v143.ExInpaint(mask = v143_m)
v143 = v143.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v143, audio_rate = 48000, channels = 2).killVideo
v143 = v143.audioDub(va)

last = v143
prefetch

