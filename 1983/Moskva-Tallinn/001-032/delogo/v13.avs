SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("d:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v13 = v13.deScratch(maxwidth=5, mindif=1)

v13_m = v13.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v13_m
v13 = v13.convertToRGB32(interlaced=false, matrix="PC.709")

v13 = v13.ExInpaint(mask = v13_m)
v13 = v13.convertToYV24(interlaced=false)

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

last = v13
prefetch

