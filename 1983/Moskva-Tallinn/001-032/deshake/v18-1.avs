SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\deshake\\"

LoadVirtualdubPlugin("d:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

v18 = LSMASHVideoSource(dst_dir + "v18m.mp4")

v18 = v18.convertToRGB32(interlaced=false) # already PC.709

v18 = v18 + v18.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v18.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v18 = v18.Deshaker(config).trim(30, 0)

v18 = v18.convertToYV24(interlaced=false, matrix="PC.709")
v18 = v18.Filter(th_SAD=1500, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v18, audio_rate = 48000, channels = 2).killVideo
v18 = v18.audioDub(va)

last = v18
prefetch(6)

