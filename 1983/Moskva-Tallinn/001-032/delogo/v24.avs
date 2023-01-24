SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v24 = v24.deScratch(maxwidth=5, mindif=1)

v24_m = v24.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 190)
#return v24_m
v24 = v24.convertToRGB32(interlaced=false, matrix="PC.709")

v24 = v24.ExInpaint(mask = v24_m)
v24 = v24.convertToYV24(interlaced=false)

va = BlankClip(v24, audio_rate = 48000, channels = 2).killVideo
v24 = v24.audioDub(va)

last = v24
prefetch

