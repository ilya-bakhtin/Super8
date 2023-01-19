SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v62 = v62.deScratch(maxwidth=5, mindif=1)

v62_m = v62.PrepareMask

v62 = v62.convertToRGB32(interlaced=false, matrix="PC.709")

v62 = v62.ExInpaint(mask = v62_m)
v62 = v62.convertToYV24(interlaced=false)

va = BlankClip(v62, audio_rate = 48000, channels = 2).killVideo
v62 = v62.audioDub(va)

last = v62
prefetch

