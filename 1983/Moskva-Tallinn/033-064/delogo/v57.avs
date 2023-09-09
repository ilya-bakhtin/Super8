SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v57 = v57.deScratch(maxwidth=5, mindif=1)

v57_m = v57.PrepareMask(mask_w = 140, mask_h = 100, ignore_high = 0.1, mask_tolerance = 200)

v57 = v57.convertToRGB32(interlaced=false, matrix="PC.709")
#return v57.interleave(v57_m)
v57 = v57.ExInpaint(mask = v57_m)
v57 = v57.convertToYV24(interlaced=false)

va = BlankClip(v57, audio_rate = 48000, channels = 2).killVideo
v57 = v57.audioDub(va)

last = v57
prefetch

