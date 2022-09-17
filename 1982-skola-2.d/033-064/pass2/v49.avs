LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v49 = LSMASHVideoSource(dst_dir + "v49s.mp4")
v49 = v49.extractY

v49 = v49.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v49, audio_rate = 48000, channels = 2).killVideo
v49 = v49.audioDub(va)

v49 = v49.convertToYV12(interlaced=false)

return v49.Prefetch

