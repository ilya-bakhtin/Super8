LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
$$$clip$$$ = LWLibavVideoSource(source_dir + "$$$clip$$$rc.avi", cache=false)
$$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false)

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

$$$clip$$$ = $$$clip$$$.removeDirt
$$$clip$$$ = $$$clip$$$.convertToYV12
$$$clip$$$ = $$$clip$$$.UnsharpMask(strength=400, radius=7, threshold=1)
$$$clip$$$ = $$$clip$$$.adjustBorders
#$$$clip$$$ = $$$clip$$$.assumefps(18).AdjustFrameRate(preset_p = "slowest")
$$$clip$$$ = $$$clip$$$.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return $$$clip$$$.Prefetch(12)
