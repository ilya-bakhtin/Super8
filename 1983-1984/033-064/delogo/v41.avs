SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v41 = v41.deScratch(maxwidth=5, mindif=1)

v41_m = v41.PrepareMask(mask_tolerance = 200)

v41 = v41.convertToRGB32(interlaced=false, matrix="PC.709")

v41 = v41.ExInpaint(mask = v41_m)
v41 = v41.convertToYV24(interlaced=false)

va = BlankClip(v41, audio_rate = 48000, channels = 2).killVideo
v41 = v41.audioDub(va)

last = v41
prefetch

