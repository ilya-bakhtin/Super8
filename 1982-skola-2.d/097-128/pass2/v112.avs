LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v112 = LSMASHVideoSource(dst_dir + "v112s.mp4")
v112 = v112.extractY

v112 = v112.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

v112 = v112.convertToYV12(interlaced=false)

return v112.Prefetch

