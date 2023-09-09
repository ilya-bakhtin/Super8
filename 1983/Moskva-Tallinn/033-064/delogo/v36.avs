SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v36 = v36.deScratch(maxwidth=5, mindif=1)

v36_m = v36.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 150, ignore_low = 0.2, ignore_high = 0.1)

v36 = v36.convertToRGB32(interlaced=false, matrix="PC.709")
#return v36.interleave(v36_m)
v36 = v36.ExInpaint(mask = v36_m)
v36 = v36.convertToYV24(interlaced=false)

va = BlankClip(v36, audio_rate = 48000, channels = 2).killVideo
v36 = v36.audioDub(va)

last = v36
prefetch

