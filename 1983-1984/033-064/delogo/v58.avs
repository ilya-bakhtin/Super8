SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v58 = v58.deScratch(maxwidth=5, mindif=1)

v58_m = v58.PrepareMask

v58 = v58.convertToRGB32(interlaced=false, matrix="PC.709")

v58 = v58.ExInpaint(mask = v58_m)
v58 = v58.convertToYV24(interlaced=false)

va = BlankClip(v58, audio_rate = 48000, channels = 2).killVideo
v58 = v58.audioDub(va)

last = v58
prefetch

