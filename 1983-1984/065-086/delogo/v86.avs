SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v86 = v86.deScratch(maxwidth=5, mindif=1)

v86_m = v86.PrepareMask

v86 = v86.convertToRGB32(interlaced=false, matrix="PC.709")

v86 = v86.ExInpaint(mask = v86_m)
v86 = v86.convertToYV24(interlaced=false)

va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

last = v86
prefetch

