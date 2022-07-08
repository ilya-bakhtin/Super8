LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v161 = LWLibavVideoSource(source_dir + "v161s.avi")
v161 = v161.convertToYV24(interlaced=false)

v161 = v161.Filter(th_SAD=300, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v161 = v161.convertToYV12(interlaced=false)

return v161.Prefetch(6)

