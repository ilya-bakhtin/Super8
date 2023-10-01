import("..\1983-Moskva-Tallinn.avs")

#v122 = v122.deScratch(maxwidth=5, mindif=1)

v122_m = v122.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v122 = v122.convertToRGB32(interlaced=false, matrix="PC.709")

v122 = v122.ExInpaint(mask = v122_m)
v122 = v122.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v122, audio_rate = 48000, channels = 2).killVideo
v122 = v122.audioDub(va)

last = v122
prefetch

