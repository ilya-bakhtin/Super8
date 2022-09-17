LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v100 = LSMASHVideoSource(dst_dir + "v100s.mp4")
v100 = v100.extractY

v100 = v100.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

v100 = v100.convertToYV12(interlaced=false)

return v100.Prefetch

