SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v45 = v45.deScratch(maxwidth=5, mindif=1)

v45_m = v45.PrepareMask

v45 = v45.convertToRGB32(interlaced=false, matrix="PC.709")

v45 = v45.ExInpaint(mask = v45_m)
v45 = v45.convertToYV24(interlaced=false)

va = BlankClip(v45, audio_rate = 48000, channels = 2).killVideo
v45 = v45.audioDub(va)

last = v45
prefetch

