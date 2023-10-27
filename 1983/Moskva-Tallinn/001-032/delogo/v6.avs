SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v6 = v6.deScratch(maxwidth=5, mindif=1)

v6_m = v6.PrepareMask#(mask_tolerance = 200)

v6 = v6.convertToRGB32(interlaced=false, matrix="PC.709")

v6 = v6.ExInpaint(mask = v6_m)
v6 = v6.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v6, audio_rate = 48000, channels = 2).killVideo
v6 = v6.audioDub(va)

last = v6
prefetch

