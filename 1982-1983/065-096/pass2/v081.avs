LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v081 = LWLibavVideoSource(source_dir + "v081s.avi").convertToYV24
v081 = v081.convertToYV24(interlaced=false)

v081 = v081.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v081 = v081.convertToYV12(interlaced=false)

return v081.Prefetch(4)

