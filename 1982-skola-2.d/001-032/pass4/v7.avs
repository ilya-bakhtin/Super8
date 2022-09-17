/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v7 = LSMASHVideoSource(dst_dir + "v7rc.mp4")
v7 = v7.extractY.convertToYV12(interlaced=false)
v7 = v7.deScratch.extractY

#v7 = v7.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v7 = v7.removeDirt
v7 = v7.convertToYV12(interlaced=false)
v7 = v7.UnsharpMask(strength=400, radius=5, threshold=1)
v7 = v7.adjustBorders
#v7 = v7.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v7 = v7.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v7.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v07 = LSMASHVideoSource(dst_dir + "v07rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v7f.mp4")
v07 = ImageSource(file = dst_dir + "v07-png\v07-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v07 = v07.convertToY.adjustSize

#v07 = v07.extractY.convertToYV12(interlaced=false)
#v07 = v07.deScratch.extractY

v07 = v07.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v07 = v07.convertBits(8).convertToYV12(interlaced=false)

v07 = v07.deScratch.extractY
v07 = v07.removeDirt
v07 = v07.convertToYV12(interlaced=false)
v07 = v07.UnsharpMask(strength=400, radius=5, threshold=1)
v07 = v07.adjustBorders
#v07 = v07.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v07 = v07.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v07, audio_rate = 48000, channels = 2).killVideo
v07 = v07.audioDub(va)

return v07.Prefetch
