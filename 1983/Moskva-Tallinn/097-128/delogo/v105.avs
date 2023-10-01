import("..\1983-Moskva-Tallinn.avs")

#v105 = v105.deScratch(maxwidth=5, mindif=1)

v105_m = v105.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v105 = v105.convertToRGB32(interlaced=false, matrix="PC.709")

v105 = v105.ExInpaint(mask = v105_m)
v105 = v105.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo
v105 = v105.audioDub(va)

last = v105
prefetch

