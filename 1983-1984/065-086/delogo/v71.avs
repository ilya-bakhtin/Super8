SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v71 = v71.deScratch(maxwidth=5, mindif=1)

v71_m = v71.PrepareMask(mask_tolerance = 200)

v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")

v71 = v71.ExInpaint(mask = v71_m)
v71 = v71.convertToYV24(interlaced=false)

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

last = v71
prefetch

