SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v39 = v39.deScratch(maxwidth=5, mindif=1)

v39_m = v39.PrepareMask

v39 = v39.convertToRGB32(interlaced=false, matrix="PC.709")

v39 = v39.ExInpaint(mask = v39_m)
v39 = v39.convertToYV24(interlaced=false)

va = BlankClip(v39, audio_rate = 48000, channels = 2).killVideo
v39 = v39.audioDub(va)

last = v39
prefetch

