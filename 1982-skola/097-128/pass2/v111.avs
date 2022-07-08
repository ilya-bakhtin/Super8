LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v111 = LWLibavVideoSource(source_dir + "v111s.avi")
v111 = v111.convertToYV24(interlaced=false)

v111 = v111.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v111 = v111.convertToYV12(interlaced=false)

return v111.Prefetch(6)

