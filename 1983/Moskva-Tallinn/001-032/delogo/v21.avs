SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("d:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v21 = v21.deScratch(maxwidth=5, mindif=1)

v21_m = v21.PrepareMask(mask_w = 140, mask_h = 90)#(mask_tolerance = 200)
#return v21_m
v21 = v21.convertToRGB32(interlaced=false, matrix="PC.709")

v21 = v21.ExInpaint(mask = v21_m)
v21 = v21.convertToYV24(interlaced=false)

va = BlankClip(v21, audio_rate = 48000, channels = 2).killVideo
v21 = v21.audioDub(va)

last = v21
prefetch

