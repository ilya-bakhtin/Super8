SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v80 = v80.deScratch(maxwidth=5, mindif=1)

v80_m = v80.PrepareMask

v80 = v80.convertToRGB32(interlaced=false, matrix="PC.709")

v80 = v80.ExInpaint(mask = v80_m)
v80 = v80.convertToYV24(interlaced=false)

va = BlankClip(v80, audio_rate = 48000, channels = 2).killVideo
v80 = v80.audioDub(va)

last = v80
prefetch

