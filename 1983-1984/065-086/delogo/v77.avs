SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v77 = v77.deScratch(maxwidth=5, mindif=1)

v77_m = v77.PrepareMask

v77 = v77.convertToRGB32(interlaced=false, matrix="PC.709")

v77 = v77.ExInpaint(mask = v77_m)
v77 = v77.convertToYV24(interlaced=false)

va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

last = v77
prefetch

