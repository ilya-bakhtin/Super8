LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v191 = LWLibavVideoSource(source_dir + "v191s.avi", cache=false)
v191 = v191.convertToYV24(interlaced=false)

v191 = v191.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v191 = v191.adjustSize
v191 = v191.convertToYV12(interlaced=false)

return v191.Prefetch(4)

