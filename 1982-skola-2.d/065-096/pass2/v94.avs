LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v94 = LSMASHVideoSource(dst_dir + "v94s.mp4")
v94 = v94.extractY

v94 = v94.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v94, audio_rate = 48000, channels = 2).killVideo
v94 = v94.audioDub(va)

v94 = v94.convertToYV12(interlaced=false)

return v94.Prefetch

