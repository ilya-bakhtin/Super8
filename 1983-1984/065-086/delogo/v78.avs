SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v78 = v78.deScratch(maxwidth=5, mindif=1)

v78_m = v78.PrepareMask

v78 = v78.convertToRGB32(interlaced=false, matrix="PC.709")

v78 = v78.ExInpaint(mask = v78_m)
v78 = v78.convertToYV24(interlaced=false)

va = BlankClip(v78, audio_rate = 48000, channels = 2).killVideo
v78 = v78.audioDub(va)

last = v78
prefetch

