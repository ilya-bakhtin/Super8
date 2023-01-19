SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v84 = v84.deScratch(maxwidth=5, mindif=1)

v84_m = v84.PrepareMask

v84 = v84.convertToRGB32(interlaced=false, matrix="PC.709")

v84 = v84.ExInpaint(mask = v84_m)
v84 = v84.convertToYV24(interlaced=false)

va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

last = v84
prefetch

