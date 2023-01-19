SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v50 = v50.deScratch(maxwidth=5, mindif=1)

v50_m = v50.PrepareMask

v50 = v50.convertToRGB32(interlaced=false, matrix="PC.709")

v50 = v50.ExInpaint(mask = v50_m)
v50 = v50.convertToYV24(interlaced=false)

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

last = v50
prefetch

