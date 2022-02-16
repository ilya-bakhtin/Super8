LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v189 = LWLibavVideoSource(source_dir + "v189s.avi", cache=false)
v189 = v189.convertToYV24(interlaced=false)

v189 = v189.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v189 = v189.adjustSize
v189 = v189.convertToYV12(interlaced=false)

return v189.Prefetch(4)

