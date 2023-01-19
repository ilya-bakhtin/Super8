SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v82 = v82.deScratch(maxwidth=5, mindif=1)

v82_m = v82.PrepareMask

v82 = v82.convertToRGB32(interlaced=false, matrix="PC.709")

v82 = v82.ExInpaint(mask = v82_m)
v82 = v82.convertToYV24(interlaced=false)

va = BlankClip(v82, audio_rate = 48000, channels = 2).killVideo
v82 = v82.audioDub(va)

last = v82
prefetch

