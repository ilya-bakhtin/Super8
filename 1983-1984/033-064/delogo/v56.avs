SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v56 = v56.deScratch(maxwidth=5, mindif=1)

v56_m = v56.PrepareMask(mask_tolerance = 200)

v56 = v56.convertToRGB32(interlaced=false, matrix="PC.709")

v56 = v56.ExInpaint(mask = v56_m)
v56 = v56.convertToYV24(interlaced=false)

va = BlankClip(v56, audio_rate = 48000, channels = 2).killVideo
v56 = v56.audioDub(va)

last = v56
prefetch

