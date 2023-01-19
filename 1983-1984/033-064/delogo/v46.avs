SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v46 = v46.deScratch(maxwidth=5, mindif=1)

v46_m = v46.PrepareMask

v46 = v46.convertToRGB32(interlaced=false, matrix="PC.709")

v46 = v46.ExInpaint(mask = v46_m)
v46 = v46.convertToYV24(interlaced=false)

va = BlankClip(v46, audio_rate = 48000, channels = 2).killVideo
v46 = v46.audioDub(va)

last = v46
prefetch

