LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v90 = LSMASHVideoSource(dst_dir + "v90s.mp4")
v90 = v90.extractY

v90 = v90.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v90, audio_rate = 48000, channels = 2).killVideo
v90 = v90.audioDub(va)

v90 = v90.convertToYV12(interlaced=false)

return v90.Prefetch

