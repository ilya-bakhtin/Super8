SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\1983-Moskva-Tallinn.avs")

#v28 = v28.deScratch(maxwidth=5, mindif=1)

v28_m = v28.PrepareMask#(mask_tolerance = 200)

v28 = v28.convertToRGB32(interlaced=false, matrix="PC.709")

v28 = v28.ExInpaint(mask = v28_m)
v28 = v28.convertToYV24(interlaced=false)

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

last = v28
prefetch

