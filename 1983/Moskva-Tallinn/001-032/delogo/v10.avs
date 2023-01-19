SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v10 = v10.deScratch(maxwidth=5, mindif=1)

v10_m = v10.PrepareMask#(mask_tolerance = 200)

v10 = v10.convertToRGB32(interlaced=false, matrix="PC.709")

v10 = v10.ExInpaint(mask = v10_m)
v10 = v10.convertToYV24(interlaced=false)

va = BlankClip(v10, audio_rate = 48000, channels = 2).killVideo
v10 = v10.audioDub(va)

last = v10
prefetch

