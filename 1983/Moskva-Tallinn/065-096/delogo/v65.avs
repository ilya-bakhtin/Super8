SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#v65 = v65.deScratch(maxwidth=5, mindif=1)

v65_m = v65.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

v65 = v65.convertToRGB32(interlaced=false, matrix="PC.709")

v65 = v65.ExInpaint(mask = v65_m)
v65 = v65.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v65, audio_rate = 48000, channels = 2).killVideo
v65 = v65.audioDub(va)

last = v65
prefetch

