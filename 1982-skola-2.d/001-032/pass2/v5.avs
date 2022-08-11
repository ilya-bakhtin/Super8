LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v5 = LSMASHVideoSource(dst_dir + "v5s.mp4")
v5 = v5.extractY

v5 = v5.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v5 = v5.convertToYV12(interlaced=false)

return v5.Prefetch

