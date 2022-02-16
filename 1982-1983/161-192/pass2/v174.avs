LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v174 = LWLibavVideoSource(source_dir + "v174s.avi", cache=false)
v174 = v174.convertToYV24(interlaced=false)

v174 = v174.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v174 = v174.adjustSize
v174 = v174.convertToYV12(interlaced=false)

return v174.Prefetch(4)

