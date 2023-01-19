SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v64 = v64.deScratch(maxwidth=5, mindif=1)

v64_m = v64.PrepareMask

v64 = v64.convertToRGB32(interlaced=false, matrix="PC.709")

v64 = v64.ExInpaint(mask = v64_m)
v64 = v64.convertToYV24(interlaced=false)

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

last = v64
prefetch

