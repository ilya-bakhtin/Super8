SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v36 = v36.deScratch(maxwidth=5, mindif=1)

v36_m = v36.PrepareMask

v36 = v36.convertToRGB32(interlaced=false, matrix="PC.709")

v36 = v36.ExInpaint(mask = v36_m)
v36 = v36.convertToYV24(interlaced=false)

va = BlankClip(v36, audio_rate = 48000, channels = 2).killVideo
v36 = v36.audioDub(va)

last = v36
prefetch

