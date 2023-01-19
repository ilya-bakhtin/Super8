SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v17 = v17.deScratch(maxwidth=5, mindif=1)

v17_m = v17.PrepareMask#(mask_tolerance = 200)

v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")

v17 = v17.ExInpaint(mask = v17_m)
v17 = v17.convertToYV24(interlaced=false)

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

last = v17
prefetch

