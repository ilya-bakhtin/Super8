LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v53 = LWLibavVideoSource(source_dir + "v53s.avi")
v53 = v53.convertToYV24(interlaced=false)

v53 = v53.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v53 = v53.convertToYV12(interlaced=false)

return v53.Prefetch(6)

