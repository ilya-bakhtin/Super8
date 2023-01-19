SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v72 = v72.deScratch(maxwidth=5, mindif=1)

v72_m = v72.PrepareMask

v72 = v72.convertToRGB32(interlaced=false, matrix="PC.709")

v72 = v72.ExInpaint(mask = v72_m)
v72 = v72.convertToYV24(interlaced=false)

va = BlankClip(v72, audio_rate = 48000, channels = 2).killVideo
v72 = v72.audioDub(va)

last = v72
prefetch

