SetFilterMTMode("Deshaker", MT_SERIALIZED)

#import("..\..\1989-sevas.avs")

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1989\\001-032\\test\\deshake\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\..\..\common.avs")
import("..\..\..\s8_functions.avs")
v6969 = LSMASHVideoSource(dst_dir + "v6969m.mp4")
/*
v6969 = v6969.convertToRGB32(interlaced=false, matrix="PC.709")

v6969 = v6969 + v6969.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v6969.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v6969 = v6969.Deshaker(config).trim(30, 0)

v6969 = v6969.convertToYV24(interlaced=false, matrix="PC.709")
*/
v6969 = v6969.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=1, sigma_c=2, prefilter=2)

va = BlankClip(v6969, audio_rate = 48000, channels = 2).killVideo
v6969 = v6969.audioDub(va)

last = v6969
prefetch#(6)

