LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v87 = LSMASHVideoSource(dst_dir + "v87s.mp4")
v87 = v87.extractY

v87 = v87.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

v87 = v87.convertToYV12(interlaced=false)

return v87.Prefetch

