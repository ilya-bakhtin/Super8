SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v1 = v1.deScratch(maxwidth=5, mindif=1)

v1_m = v1.PrepareMask(mask_tolerance = 200)

v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")

v1 = v1.ExInpaint(mask = v1_m)
v1 = v1.convertToYV24(interlaced=false)

va = BlankClip(v1, audio_rate = 48000, channels = 2).killVideo
v1 = v1.audioDub(va)

last = v1
prefetch

