import("..\1983-Moskva-Tallinn.avs")

#v118 = v118.deScratch(maxwidth=5, mindif=1)

v118_m = v118.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v118 = v118.convertToRGB32(interlaced=false, matrix="PC.709")

v118 = v118.ExInpaint(mask = v118_m)
v118 = v118.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v118, audio_rate = 48000, channels = 2).killVideo
v118 = v118.audioDub(va)

last = v118
prefetch

