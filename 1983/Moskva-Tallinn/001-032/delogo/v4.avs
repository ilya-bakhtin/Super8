SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v4 = v4.deScratch(maxwidth=5, mindif=1)

v4_m = v4.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 150)
#return v4_m
v4 = v4.convertToRGB32(interlaced=false, matrix="PC.709")

v4 = v4.ExInpaint(mask = v4_m)
v4 = v4.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v4, audio_rate = 48000, channels = 2).killVideo
v4 = v4.audioDub(va)

last = v4
prefetch

