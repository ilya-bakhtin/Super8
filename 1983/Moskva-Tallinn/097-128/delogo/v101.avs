import("..\1983-Moskva-Tallinn.avs")

#v101 = v101.deScratch(maxwidth=5, mindif=1)

v101_m = v101.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v101 = v101.convertToRGB32(interlaced=false, matrix="PC.709")

v101 = v101.ExInpaint(mask = v101_m)
v101 = v101.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101.audioDub(va)

last = v101
prefetch

