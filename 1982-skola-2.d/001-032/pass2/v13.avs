LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v13 = LSMASHVideoSource(dst_dir + "v13s.mp4")
v13 = v13.extractY

v13 = v13.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v13 = v13.convertToYV12(interlaced=false)

return v13.Prefetch

