import("..\1983-Moskva-Tallinn.avs")

#v114 = v114.deScratch(maxwidth=5, mindif=1)

v114_m = v114.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v114 = v114.convertToRGB32(interlaced=false, matrix="PC.709")

v114 = v114.ExInpaint(mask = v114_m)
v114 = v114.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v114, audio_rate = 48000, channels = 2).killVideo
v114 = v114.audioDub(va)

last = v114
prefetch

