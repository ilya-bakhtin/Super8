LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v21 = LSMASHVideoSource(dst_dir + "v21s.mp4")
v21 = v21.extractY

v21 = v21.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v21 = v21.convertToYV12(interlaced=false)

return v21.Prefetch

