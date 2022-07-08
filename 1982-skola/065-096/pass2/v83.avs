LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v83 = LWLibavVideoSource(source_dir + "v83s.avi")
v83 = v83.convertToYV24(interlaced=false)

v83 = v83.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v83 = v83.convertToYV12(interlaced=false)

return v83.Prefetch(6)

