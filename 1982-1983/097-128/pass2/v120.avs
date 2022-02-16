LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v120 = LWLibavVideoSource(source_dir + "v120s.avi")
v120 = v120.convertToYV24(interlaced=false)

v120 = v120.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v120 = v120.adjustSize
v120 = v120.convertToYV12(interlaced=false)

return v120.Prefetch(4)

