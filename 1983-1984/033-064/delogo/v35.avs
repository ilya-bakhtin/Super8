SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v35 = v35.deScratch(maxwidth=5, mindif=1)

v35_m = v35.PrepareMask

v35 = v35.convertToRGB32(interlaced=false, matrix="PC.709")

v35 = v35.ExInpaint(mask = v35_m)
v35 = v35.convertToYV24(interlaced=false)

va = BlankClip(v35, audio_rate = 48000, channels = 2).killVideo
v35 = v35.audioDub(va)

last = v35
prefetch

