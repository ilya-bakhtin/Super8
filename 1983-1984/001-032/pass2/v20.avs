LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1983-1984.mov.avs")
v20 = LWLibavVideoSource(source_dir + "v20s.avi")
v20 = v20.convertToYV24(interlaced=false)

v20 = v20.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v20 = v20.convertToYV12(interlaced=false)

return v20.Prefetch

