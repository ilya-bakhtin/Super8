import("..\1983-Moskva-Tallinn.avs")

#v133 = v133.deScratch(maxwidth=5, mindif=1)

v133_m = v133.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v133 = v133.convertToRGB32(interlaced=false, matrix="PC.709")

v133 = v133.ExInpaint(mask = v133_m)
v133 = v133.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v133, audio_rate = 48000, channels = 2).killVideo
v133 = v133.audioDub(va)

last = v133
prefetch

