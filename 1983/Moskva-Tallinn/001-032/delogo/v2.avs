SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v2 = v2.deScratch(maxwidth=5, mindif=1)

v2_m = v2.PrepareMask#(mask_tolerance = 200)

v2 = v2.convertToRGB32(interlaced=false, matrix="PC.709")

v2 = v2.ExInpaint(mask = v2_m)
v2 = v2.convertToYV24(interlaced=false)

va = BlankClip(v2, audio_rate = 48000, channels = 2).killVideo
v2 = v2.audioDub(va)

last = v2
prefetch

