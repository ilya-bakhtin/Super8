SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v23 = v23.deScratch(maxwidth=5, mindif=1)

v23_m = v23.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v23_m
v23 = v23.convertToRGB32(interlaced=false, matrix="PC.709")

v23 = v23.ExInpaint(mask = v23_m)
v23 = v23.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v23, audio_rate = 48000, channels = 2).killVideo
v23 = v23.audioDub(va)

last = v23
prefetch

