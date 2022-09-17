/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v5 = LSMASHVideoSource(dst_dir + "v5rc.mp4")
v5 = v5.extractY.convertToYV12(interlaced=false)
v5 = v5.deScratch.extractY

#v5 = v5.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v5 = v5.removeDirt
v5 = v5.convertToYV12(interlaced=false)
v5 = v5.UnsharpMask(strength=400, radius=5, threshold=1)
v5 = v5.adjustBorders
#v5 = v5.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v5 = v5.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v5.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v05 = LSMASHVideoSource(dst_dir + "v05rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v5f.mp4")
v05 = ImageSource(file = dst_dir + "v05-png\v05-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v05 = v05.convertToY.adjustSize

#v05 = v05.extractY.convertToYV12(interlaced=false)
#v05 = v05.deScratch.extractY

v05 = v05.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v05 = v05.convertBits(8).convertToYV12(interlaced=false)

v05 = v05.deScratch.extractY
v05 = v05.removeDirt
v05 = v05.convertToYV12(interlaced=false)
v05 = v05.UnsharpMask(strength=400, radius=5, threshold=1)
v05 = v05.adjustBorders
#v05 = v05.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v05 = v05.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v05, audio_rate = 48000, channels = 2).killVideo
v05 = v05.audioDub(va)

return v05.Prefetch
