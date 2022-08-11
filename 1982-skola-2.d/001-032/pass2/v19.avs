LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
v19 = LSMASHVideoSource(dst_dir + "v19s.mp4")
v19 = v19.extractY

v19 = v19.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v19 = v19.convertToYV12(interlaced=false)

return v19.Prefetch

