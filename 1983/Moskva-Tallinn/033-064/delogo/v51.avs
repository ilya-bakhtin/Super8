SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v51 = v51.deScratch(maxwidth=5, mindif=1)

v51_m = v51.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v51 = v51.convertToRGB32(interlaced=false, matrix="PC.709")

v51 = v51.ExInpaint(mask = v51_m)
v51 = v51.convertToYV24(interlaced=false)

va = BlankClip(v51, audio_rate = 48000, channels = 2).killVideo
v51 = v51.audioDub(va)

last = v51
prefetch

