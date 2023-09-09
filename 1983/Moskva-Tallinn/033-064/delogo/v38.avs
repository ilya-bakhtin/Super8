SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v38 = v38.deScratch(maxwidth=5, mindif=1)

v38_m = v38.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 150)

v38 = v38.convertToRGB32(interlaced=false, matrix="PC.709")
#return v38.interleave(v38_m)
v38 = v38.ExInpaint(mask = v38_m)
v38 = v38.convertToYV24(interlaced=false)

va = BlankClip(v38, audio_rate = 48000, channels = 2).killVideo
v38 = v38.audioDub(va)

last = v38
prefetch

