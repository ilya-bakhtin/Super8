SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\..\s8_functions.avs")
import("..\..\common.avs")
import("..\1977-1979.avs")

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1977-1979\\065-096\\deshake\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

#v83 = LSMASHVideoSource(dst_dir + "v83m.mp4")

v83 = v83.convertToRGB32(interlaced=false, matrix="PC.709")

v83 = v83 + v83.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v83.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v83 = v83.Deshaker(config).trim(30, 0)

v83 = v83.convertToYV24(interlaced=false, matrix="PC.709")
v83 = v83.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v83, audio_rate = 48000, channels = 2).killVideo
v83 = v83.audioDub(va)

last = v83
prefetch(6)

