LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1983-1984.mov.avs")
v1 = LWLibavVideoSource(source_dir + "v1s.avi")
v1 = v1.convertToYV24(interlaced=false)

v1 = v1.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v1 = v1.convertToYV12(interlaced=false)

return v1.Prefetch

