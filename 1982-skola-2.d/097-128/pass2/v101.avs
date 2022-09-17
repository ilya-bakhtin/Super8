LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v101 = LSMASHVideoSource(dst_dir + "v101s.mp4")
v101 = v101.extractY

v101 = v101.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101.audioDub(va)

v101 = v101.convertToYV12(interlaced=false)

return v101.Prefetch

