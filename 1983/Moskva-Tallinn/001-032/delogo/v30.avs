SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v30 = v30.deScratch(maxwidth=5, mindif=1)

v30_m = v30.PrepareMask#(mask_tolerance = 200)

v30 = v30.convertToRGB32(interlaced=false, matrix="PC.709")

v30 = v30.ExInpaint(mask = v30_m)
v30 = v30.convertToYV24(interlaced=false)

va = BlankClip(v30, audio_rate = 48000, channels = 2).killVideo
v30 = v30.audioDub(va)

last = v30
prefetch

