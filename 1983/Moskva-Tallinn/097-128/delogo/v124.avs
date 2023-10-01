import("..\1983-Moskva-Tallinn.avs")

#v124 = v124.deScratch(maxwidth=5, mindif=1)

v124_m = v124.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v124 = v124.convertToRGB32(interlaced=false, matrix="PC.709")

v124 = v124.ExInpaint(mask = v124_m)
v124 = v124.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v124, audio_rate = 48000, channels = 2).killVideo
v124 = v124.audioDub(va)

last = v124
prefetch

