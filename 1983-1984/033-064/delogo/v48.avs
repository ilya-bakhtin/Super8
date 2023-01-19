SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v48 = v48.deScratch(maxwidth=5, mindif=1)

v48_m = v48.PrepareMask

v48 = v48.convertToRGB32(interlaced=false, matrix="PC.709")

v48 = v48.ExInpaint(mask = v48_m)
v48 = v48.convertToYV24(interlaced=false)

va = BlankClip(v48, audio_rate = 48000, channels = 2).killVideo
v48 = v48.audioDub(va)

last = v48
prefetch

