SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-1984.avs")

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\deshake\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

v55 = LSMASHVideoSource(dst_dir + "v55m.mp4")

v55 = v55.convertToRGB32(interlaced=false) # already PC.709

v55 = v55 + v55.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v55.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v55 = v55.Deshaker(config).trim(30, 0)

v55 = v55.convertToYV24(interlaced=false, matrix="PC.709")
v55 = v55.Filter(th_SAD=1500, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

last = v55
prefetch

