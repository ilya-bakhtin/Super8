LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v58 = LWLibavVideoSource(source_dir + "v58s.avi")
v58 = v58.convertToYV24(interlaced=false)

v58 = v58.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v58 = v58.convertToYV12(interlaced=false)

return v58.Prefetch(6)

