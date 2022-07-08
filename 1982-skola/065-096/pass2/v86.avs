LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v86 = LWLibavVideoSource(source_dir + "v86s.avi")
v86 = v86.convertToYV24(interlaced=false)

v86 = v86.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v86 = v86.convertToYV12(interlaced=false)

return v86.Prefetch(6)

