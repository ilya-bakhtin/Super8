import("..\common.avs")
import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
$$$clip$$$ = LSMASHVideoSource(dst_dir + "$$$clip$$$rc.mp4")

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

$$$clip$$$ = $$$clip$$$.convertToYV12(interlaced=false)

$$$clip$$$ = $$$clip$$$.UnsharpMask(strength=500, radius=5, threshold=1)
$$$clip$$$ = $$$clip$$$.adjustBorders

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

return $$$clip$$$.Prefetch
