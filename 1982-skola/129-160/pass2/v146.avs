LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v146 = LWLibavVideoSource(source_dir + "v146s.avi")
v146 = v146.convertToYV24(interlaced=false)

v146 = v146.Filter(th_SAD=300, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v146 = v146.convertToYV12(interlaced=false)

return v146.Prefetch(6)

