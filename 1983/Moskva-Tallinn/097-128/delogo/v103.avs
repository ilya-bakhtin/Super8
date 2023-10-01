import("..\1983-Moskva-Tallinn.avs")

#v103 = v103.deScratch(maxwidth=5, mindif=1)

v103_m = v103.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v103 = v103.convertToRGB32(interlaced=false, matrix="PC.709")

v103 = v103.ExInpaint(mask = v103_m)
v103 = v103.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v103, audio_rate = 48000, channels = 2).killVideo
v103 = v103.audioDub(va)

last = v103
prefetch

