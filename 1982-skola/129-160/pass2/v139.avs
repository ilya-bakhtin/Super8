LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v139 = LWLibavVideoSource(source_dir + "v139s.avi")
v139 = v139.convertToYV24(interlaced=false)

v139 = v139.Filter(th_SAD=300, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v139 = v139.convertToYV12(interlaced=false)

return v139.Prefetch(6)

