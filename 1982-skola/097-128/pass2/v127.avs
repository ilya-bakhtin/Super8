LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v127 = LWLibavVideoSource(source_dir + "v127s.avi")
v127 = v127.convertToYV24(interlaced=false)
#v127 = v127.gaussResize(v127.width/3, v126.height/3)#.autolevels(filterRadius=0)
v127_0 = v127

v127 = v127.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
#v127 = v127.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=true, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v127 = v127_0.interleave(v127)
v127 = v127.convertToYV12(interlaced=false)

return v127.Prefetch(6)

