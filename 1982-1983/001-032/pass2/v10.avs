LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v10 = LWLibavVideoSource(source_dir + "v10s.avi").convertToYV24
v10 = v10.convertToYV24(interlaced=false)

v10 = v10.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v10 = v10.convertToYV12(interlaced=false)

return v10.Prefetch(6)

