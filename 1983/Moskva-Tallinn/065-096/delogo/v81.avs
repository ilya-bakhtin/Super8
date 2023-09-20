SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v81 = v81.deScratch(maxwidth=5, mindif=1)

v81_m = v81.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v81 = v81.convertToRGB32(interlaced=false, matrix="PC.709")

v81 = v81.ExInpaint(mask = v81_m)
v81 = v81.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v81, audio_rate = 48000, channels = 2).killVideo
v81 = v81.audioDub(va)

last = v81
prefetch

