#LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v10 = LWLibavVideoSource(source_dir + "v10s.avi")
v10 = v10.convertToYV24(interlaced=false)

v10 = v10.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v10 = v10.convertToYV12(interlaced=false)

return v10.Prefetch(6)

