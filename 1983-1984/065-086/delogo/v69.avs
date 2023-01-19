SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v69 = v69.deScratch(maxwidth=5, mindif=1)

v69_m = v69.PrepareMask

v69 = v69.convertToRGB32(interlaced=false, matrix="PC.709")

v69 = v69.ExInpaint(mask = v69_m)
v69 = v69.convertToYV24(interlaced=false)

va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

last = v69
prefetch

