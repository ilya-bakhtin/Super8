LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v115 = LWLibavVideoSource(source_dir + "v115s.avi")
v115 = v115.convertToYV24(interlaced=false)

v115 = v115.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v115 = v115.adjustSize
v115 = v115.convertToYV12(interlaced=false)

return v115.Prefetch(4)

