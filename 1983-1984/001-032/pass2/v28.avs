LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1983-1984.mov.avs")
v28 = LWLibavVideoSource(source_dir + "v28s.avi")
v28 = v28.convertToYV24(interlaced=false)

v28 = v28.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v28 = v28.convertToYV12(interlaced=false)

return v28.Prefetch

