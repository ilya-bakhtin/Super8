LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v079 = LWLibavVideoSource(source_dir + "v079s.avi").convertToYV24
v079 = v079.convertToYV24(interlaced=false)

v079 = v079.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v079 = v079.convertToYV12(interlaced=false)

return v079.Prefetch(4)

