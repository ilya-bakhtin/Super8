SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v8 = v8.deScratch(maxwidth=5, mindif=1)

v8_m = v8.PrepareMask#(mask_tolerance = 200)

v8 = v8.convertToRGB32(interlaced=false, matrix="PC.709")

v8 = v8.ExInpaint(mask = v8_m)
v8 = v8.convertToYV24(interlaced=false)

va = BlankClip(v8, audio_rate = 48000, channels = 2).killVideo
v8 = v8.audioDub(va)

last = v8
prefetch

