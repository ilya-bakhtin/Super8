SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v66 = v66.deScratch(maxwidth=5, mindif=1)

v66_m = v66.PrepareMask(mask_tolerance = 200)

v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")

v66 = v66.ExInpaint(mask = v66_m)
v66 = v66.convertToYV24(interlaced=false)

va = BlankClip(v66, audio_rate = 48000, channels = 2).killVideo
v66 = v66.audioDub(va)

last = v66
prefetch

