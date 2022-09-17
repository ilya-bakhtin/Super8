LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#$$$clip$$$ = LSMASHVideoSource(dst_dir + "$$$clip$$$rc.mp4")
vf = LSMASHVideoSource(dst_dir + "$$$clip$$$f.mp4")
$$$clip$$$ = ImageSource(file = dst_dir + "$$$clip$$$-png\$$$clip$$$-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

$$$clip$$$ = $$$clip$$$.convertToY.adjustSize

#$$$clip$$$ = $$$clip$$$.extractY.convertToYV12(interlaced=false)
#$$$clip$$$ = $$$clip$$$.deScratch.extractY

$$$clip$$$ = $$$clip$$$.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

$$$clip$$$ = $$$clip$$$.convertBits(8).convertToYV12(interlaced=false)

$$$clip$$$ = $$$clip$$$.deScratch.extractY
$$$clip$$$ = $$$clip$$$.removeDirt
$$$clip$$$ = $$$clip$$$.convertToYV12(interlaced=false)
$$$clip$$$ = $$$clip$$$.UnsharpMask(strength=400, radius=5, threshold=1)
$$$clip$$$ = $$$clip$$$.adjustBorders
#$$$clip$$$ = $$$clip$$$.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#$$$clip$$$ = $$$clip$$$.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

return $$$clip$$$.Prefetch
