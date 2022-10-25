LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
$$$clip$$$ = LSMASHVideoSource(dst_dir + "$$$clip$$$f.mp4")

$$$clip$$$ = $$$clip$$$.autolevels(gamma=0.7)

$$$clip$$$ = $$$clip$$$.convertToY.adjustSize

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

$$$clip$$$ = $$$clip$$$.convertBits(8).convertToYV12(interlaced=false)

$$$clip$$$ = $$$clip$$$.deScratch.extractY
$$$clip$$$ = $$$clip$$$.removeDirt

$$$clip$$$ = $$$clip$$$.convertToYV12(interlaced=false)

$$$clip$$$ = $$$clip$$$.UnsharpMask(strength=400, radius=5, threshold=1)
$$$clip$$$ = $$$clip$$$.adjustBorders

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

return $$$clip$$$.Prefetch
