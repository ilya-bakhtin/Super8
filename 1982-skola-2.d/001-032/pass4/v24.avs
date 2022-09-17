/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v24 = LSMASHVideoSource(dst_dir + "v24rc.mp4")
v24 = ImageSource(file = dst_dir + "v24-png\v24-%04d copy.png", pixel_type="RGB48", start=0, end=84, fps=18)
#v24 = v24.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v24 = v24.convertToY
v24 = v24.adjustSize

#v24 = v24.extractY.convertToYV12(interlaced=false)
#v24 = v24.deScratch.extractY

v24 = v24.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v24 = v24.convertBits(8)

v24 = v24.convertToYV12(interlaced=false)
#v24 = v24.autolevels
#return v24.histogram("levels")
v24 = v24.deScratch.extractY
v24 = v24.removeDirt
v24 = v24.convertToYV12(interlaced=false)
v24 = v24.UnsharpMask(strength=400, radius=5, threshold=1)
v24 = v24.adjustBorders
#v24 = v24.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v24 = v24.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v24_0 = LSMASHVideoSource(dst_dir + "v24r-0.mp4")
#v24 = v24_0.interleave(v24)

va = BlankClip(v24, audio_rate = 48000, channels = 2).killVideo
v24 = v24.audioDub(va)

return v24.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v24 = LSMASHVideoSource(dst_dir + "v24rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v24f.mp4")
v24 = ImageSource(file = dst_dir + "v24-png\v24-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v24 = v24.convertToY.adjustSize

#v24 = v24.extractY.convertToYV12(interlaced=false)
#v24 = v24.deScratch.extractY

v24 = v24.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v24 = v24.convertBits(8).convertToYV12(interlaced=false)

v24 = v24.deScratch.extractY
v24 = v24.removeDirt
v24 = v24.convertToYV12(interlaced=false)
v24 = v24.UnsharpMask(strength=400, radius=5, threshold=1)
v24 = v24.adjustBorders
#v24 = v24.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v24 = v24.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v24, audio_rate = 48000, channels = 2).killVideo
v24 = v24.audioDub(va)

return v24.Prefetch
