LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v61 = LWLibavVideoSource(source_dir + "v61s.avi").convertToYV24
v61 = v61.convertToYV24(interlaced=false)

v61 = v61.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v61 = v61.convertToYV12(interlaced=false)

return v61.Prefetch(6)

