SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v20 = v20.deScratch(maxwidth=5, mindif=1)

v20_m = v20.PrepareMask#(mask_tolerance = 200)

v20 = v20.convertToRGB32(interlaced=false, matrix="PC.709")

v20 = v20.ExInpaint(mask = v20_m)
v20 = v20.convertToYV24(interlaced=false)

va = BlankClip(v20, audio_rate = 48000, channels = 2).killVideo
v20 = v20.audioDub(va)

last = v20
prefetch

