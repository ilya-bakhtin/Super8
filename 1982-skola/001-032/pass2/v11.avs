#LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v11 = LWLibavVideoSource(source_dir + "v11s.avi")
v11 = v11.convertToYV24(interlaced=false)

v11 = v11.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v11 = v11.convertToYV12(interlaced=false)

return v11.Prefetch(6)

