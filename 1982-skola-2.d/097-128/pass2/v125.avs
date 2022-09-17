LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v125 = LSMASHVideoSource(dst_dir + "v125s.mp4")
v125 = v125.extractY

v125 = v125.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v125, audio_rate = 48000, channels = 2).killVideo
v125 = v125.audioDub(va)

v125 = v125.convertToYV12(interlaced=false)

return v125.Prefetch

