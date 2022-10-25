SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-1984.avs")

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\001-032\\24-32\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

v28 = LSMASHVideoSource(dst_dir + "v28m.mp4")

v28 = v28.convertToRGB32(interlaced=false) # already PC.709

v28 = v28 + v28.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v28.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v28 = v28.Deshaker(config).trim(30, 0)

v28 = v28.convertToYV24(interlaced=false, matrix="PC.709")
v28 = v28.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

last = v28
prefetch

