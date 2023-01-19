SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v65 = v65.deScratch(maxwidth=5, mindif=1)

v65_m = v65.PrepareMask

v65 = v65.convertToRGB32(interlaced=false, matrix="PC.709")

v65 = v65.ExInpaint(mask = v65_m)
v65 = v65.convertToYV24(interlaced=false)

va = BlankClip(v65, audio_rate = 48000, channels = 2).killVideo
v65 = v65.audioDub(va)

last = v65
prefetch

