LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
$$$clip$$$ = LWLibavVideoSource(source_dir + "$$$clip$$$rc.avi", cache=false)
$$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false)

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

$$$clip$$$ = $$$clip$$$.removeDirt
$$$clip$$$ = $$$clip$$$.convertToYV12
$$$clip$$$ = $$$clip$$$.UnsharpMask(strength=300, radius=5, threshold=1)
$$$clip$$$ = $$$clip$$$.adjustBorders
$$$clip$$$ = $$$clip$$$.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return $$$clip$$$.Prefetch(12)
