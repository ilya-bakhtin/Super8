SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v3 = v3.deScratch(maxwidth=5, mindif=1)

v3_m = v3.PrepareMask(mask_w = 148, mask_h = 100, mask_tolerance = 200)
#return v3_m
v3 = v3.convertToRGB32(interlaced=false, matrix="PC.709")

v3 = v3.ExInpaint(mask = v3_m)
v3 = v3.convertToYV24(interlaced=false)

va = BlankClip(v3, audio_rate = 48000, channels = 2).killVideo
v3 = v3.audioDub(va)

last = v3
prefetch

