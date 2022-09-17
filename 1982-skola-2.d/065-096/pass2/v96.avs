LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v96 = LSMASHVideoSource(dst_dir + "v96s.mp4")
v96 = v96.extractY

v96 = v96.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v96, audio_rate = 48000, channels = 2).killVideo
v96 = v96.audioDub(va)

v96 = v96.convertToYV12(interlaced=false)

return v96.Prefetch

