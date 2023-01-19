SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v55 = v55.deScratch(maxwidth=5, mindif=1)

v55_m = v55.PrepareMask

v55 = v55.convertToRGB32(interlaced=false, matrix="PC.709")

v55 = v55.ExInpaint(mask = v55_m)
v55 = v55.convertToYV24(interlaced=false)

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

last = v55
prefetch

