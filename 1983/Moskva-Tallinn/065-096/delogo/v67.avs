SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v67 = v67.deScratch(maxwidth=5, mindif=1)

v67_m = v67.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v67 = v67.convertToRGB32(interlaced=false, matrix="PC.709")

v67 = v67.ExInpaint(mask = v67_m)
v67 = v67.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v67, audio_rate = 48000, channels = 2).killVideo
v67 = v67.audioDub(va)

last = v67
prefetch

