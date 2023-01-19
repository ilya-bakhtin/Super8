SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v7 = v7.deScratch(maxwidth=5, mindif=1)

v7_m = v7.PrepareMask#(mask_tolerance = 200)

v7 = v7.convertToRGB32(interlaced=false, matrix="PC.709")

v7 = v7.ExInpaint(mask = v7_m)
v7 = v7.convertToYV24(interlaced=false)

va = BlankClip(v7, audio_rate = 48000, channels = 2).killVideo
v7 = v7.audioDub(va)

last = v7
prefetch

