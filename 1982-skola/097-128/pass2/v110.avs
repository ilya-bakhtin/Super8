LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v110 = LWLibavVideoSource(source_dir + "v110s.avi")
v110 = v110.convertToYV24(interlaced=false)

v110 = v110.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v110 = v110.convertToYV12(interlaced=false)

return v110.Prefetch(6)

