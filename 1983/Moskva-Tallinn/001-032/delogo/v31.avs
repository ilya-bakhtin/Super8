SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v31 = v31.deScratch(maxwidth=5, mindif=1)

v31_m = v31.PrepareMask#(mask_tolerance = 200)

v31 = v31.convertToRGB32(interlaced=false, matrix="PC.709")

v31 = v31.ExInpaint(mask = v31_m)
v31 = v31.convertToYV24(interlaced=false)

va = BlankClip(v31, audio_rate = 48000, channels = 2).killVideo
v31 = v31.audioDub(va)

last = v31
prefetch

