LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v102 = LWLibavVideoSource(source_dir + "v102s.avi")
v102 = v102.convertToYV24(interlaced=false)

v102 = v102.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v102 = v102.adjustSize
v102 = v102.convertToYV12(interlaced=false)

return v102.Prefetch(4)

