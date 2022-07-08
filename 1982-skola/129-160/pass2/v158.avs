LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v158 = LWLibavVideoSource(source_dir + "v158s.avi")
v158 = v158.convertToYV24(interlaced=false)

v158 = v158.Filter(th_SAD=300, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v158 = v158.convertToYV12(interlaced=false)

return v158.Prefetch(6)

