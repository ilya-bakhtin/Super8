import("..\1983-Moskva-Tallinn.avs")

#v117 = v117.deScratch(maxwidth=5, mindif=1)

v117_m = v117.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v117 = v117.convertToRGB32(interlaced=false, matrix="PC.709")

v117 = v117.ExInpaint(mask = v117_m)
v117 = v117.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v117, audio_rate = 48000, channels = 2).killVideo
v117 = v117.audioDub(va)

last = v117
prefetch

