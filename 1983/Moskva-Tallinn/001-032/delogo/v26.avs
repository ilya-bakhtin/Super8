SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v26 = v26.deScratch(maxwidth=5, mindif=1)

v26_m = v26.PrepareMask#(mask_tolerance = 200)

v26 = v26.convertToRGB32(interlaced=false, matrix="PC.709")

v26 = v26.ExInpaint(mask = v26_m)
v26 = v26.convertToYV24(interlaced=false)

va = BlankClip(v26, audio_rate = 48000, channels = 2).killVideo
v26 = v26.audioDub(va)

last = v26
prefetch

