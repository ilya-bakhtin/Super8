SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v68 = v68.deScratch(maxwidth=5, mindif=1)

v68_m = v68.PrepareMask

v68 = v68.convertToRGB32(interlaced=false, matrix="PC.709")

v68 = v68.ExInpaint(mask = v68_m)
v68 = v68.convertToYV24(interlaced=false)

va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

last = v68
prefetch

