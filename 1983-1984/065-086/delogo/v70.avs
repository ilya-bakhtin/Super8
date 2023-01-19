SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v70 = v70.deScratch(maxwidth=5, mindif=1)

v70_m = v70.PrepareMask(mask_tolerance = 200)

v70 = v70.convertToRGB32(interlaced=false, matrix="PC.709")

v70 = v70.ExInpaint(mask = v70_m)
v70 = v70.convertToYV24(interlaced=false)

va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

last = v70
prefetch

