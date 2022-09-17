LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("common.avs")
import("..\1982-skola-2.avs")
$$$clip$$$ = LSMASHVideoSource(dst_dir + "$$$clip$$$s.mp4")
$$$clip$$$ = $$$clip$$$.extractY

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

$$$clip$$$ = $$$clip$$$.convertToYV12(interlaced=false)

return $$$clip$$$.Prefetch
