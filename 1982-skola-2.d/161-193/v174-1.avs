SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1982-skola-2.d\\161-193\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("1982-skola-2.avs")

v174 = v174.extractY.convertToYV12.deScratch(maxwidth=5, mindif=1)

v174 = v174.convertToRGB32(interlaced=false, matrix="PC.709")

v174 = v174 + v174.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v174.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v174 = v174.Deshaker(config).trim(30, 0)

v174 = v174.convertToYV24(interlaced=false, matrix="PC.709")
v174 = v174.extractY
v174 = v174.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v174, audio_rate = 48000, channels = 2).killVideo
v174 = v174.audioDub(va)

v174 = v174.convertToYV12 #(interlaced=false, matrix="PC.709")

last = v174
prefetch

