SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v9 = v9.deScratch(maxwidth=5, mindif=1)

v9_m = v9.PrepareMask#(mask_tolerance = 200)

v9 = v9.convertToRGB32(interlaced=false, matrix="PC.709")

v9 = v9.ExInpaint(mask = v9_m)
v9 = v9.convertToYV24(interlaced=false)

va = BlankClip(v9, audio_rate = 48000, channels = 2).killVideo
v9 = v9.audioDub(va)

last = v9
prefetch

