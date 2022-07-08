#LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
$$$clip$$$ = LWLibavVideoSource(source_dir + "$$$clip$$$s.avi")
$$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false)

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

$$$clip$$$ = $$$clip$$$.convertToYV12(interlaced=false)

return $$$clip$$$.Prefetch(6)
