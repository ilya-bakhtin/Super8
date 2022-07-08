LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v105 = LWLibavVideoSource(source_dir + "v105s.avi")
v105 = v105.convertToYV24(interlaced=false)

v105 = v105.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v105 = v105.convertToYV12(interlaced=false)

return v105.Prefetch(6)

