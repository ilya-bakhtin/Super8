SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\..\s8_functions.avs")
import("..\..\common.avs")

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Petrohrad-Kemerovo\\065-096\\deshake\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

v71 = LSMASHVideoSource(dst_dir + "v71m.mp4")

v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")

v71 = v71 + v71.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v71.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v71 = v71.Deshaker(config).trim(30, 0)

v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")
v71 = v71.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

last = v71
prefetch(6)

