import("..\1983-Moskva-Tallinn.avs")

#v115 = v115.deScratch(maxwidth=5, mindif=1)

v115_m = v115.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v115 = v115.convertToRGB32(interlaced=false, matrix="PC.709")

v115 = v115.ExInpaint(mask = v115_m)
v115 = v115.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v115, audio_rate = 48000, channels = 2).killVideo
v115 = v115.audioDub(va)

last = v115
prefetch

