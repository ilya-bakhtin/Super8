SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v83 = v83.deScratch(maxwidth=5, mindif=1)

v83_m = v83.PrepareMask

v83 = v83.convertToRGB32(interlaced=false, matrix="PC.709")

v83 = v83.ExInpaint(mask = v83_m)
v83 = v83.convertToYV24(interlaced=false)

va = BlankClip(v83, audio_rate = 48000, channels = 2).killVideo
v83 = v83.audioDub(va)

last = v83
prefetch

