SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v14 = v14.deScratch(maxwidth=5, mindif=1)

v14_m = v14.PrepareMask#(mask_tolerance = 200)

v14 = v14.convertToRGB32(interlaced=false, matrix="PC.709")

v14 = v14.ExInpaint(mask = v14_m)
v14 = v14.convertToYV24(interlaced=false)

va = BlankClip(v14, audio_rate = 48000, channels = 2).killVideo
v14 = v14.audioDub(va)

last = v14
prefetch

