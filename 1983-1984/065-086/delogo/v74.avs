SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v74 = v74.deScratch(maxwidth=5, mindif=1)

v74_m = v74.PrepareMask

v74 = v74.convertToRGB32(interlaced=false, matrix="PC.709")

v74 = v74.ExInpaint(mask = v74_m)
v74 = v74.convertToYV24(interlaced=false)

va = BlankClip(v74, audio_rate = 48000, channels = 2).killVideo
v74 = v74.audioDub(va)

last = v74
prefetch

