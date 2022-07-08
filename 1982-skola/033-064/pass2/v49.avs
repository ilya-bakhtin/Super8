LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v49 = LWLibavVideoSource(source_dir + "v49s.avi")
v49 = v49.convertToYV24(interlaced=false)

v49 = v49.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v49 = v49.convertToYV12(interlaced=false)

return v49.Prefetch(6)

