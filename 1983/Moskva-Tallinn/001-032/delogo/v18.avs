SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v18 = v18.deScratch(maxwidth=5, mindif=1)

v18_m = v18.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 130)
#return v18_m
v18 = v18.convertToRGB32(interlaced=false, matrix="PC.709")

v18 = v18.ExInpaint(mask = v18_m)
v18 = v18.convertToYV24(interlaced=false)

va = BlankClip(v18, audio_rate = 48000, channels = 2).killVideo
v18 = v18.audioDub(va)

last = v18
prefetch

