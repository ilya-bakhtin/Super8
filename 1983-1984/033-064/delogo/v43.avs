SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v43 = v43.deScratch(maxwidth=5, mindif=1)

v43_m = v43.PrepareMask

v43 = v43.convertToRGB32(interlaced=false, matrix="PC.709")

v43 = v43.ExInpaint(mask = v43_m)
v43 = v43.convertToYV24(interlaced=false)

va = BlankClip(v43, audio_rate = 48000, channels = 2).killVideo
v43 = v43.audioDub(va)

last = v43
prefetch

