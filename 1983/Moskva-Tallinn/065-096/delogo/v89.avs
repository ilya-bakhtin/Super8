SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v89 = v89.deScratch(maxwidth=5, mindif=1)

v89_m = v89.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v89 = v89.convertToRGB32(interlaced=false, matrix="PC.709")

v89 = v89.ExInpaint(mask = v89_m)
v89 = v89.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v89, audio_rate = 48000, channels = 2).killVideo
v89 = v89.audioDub(va)

last = v89
prefetch

