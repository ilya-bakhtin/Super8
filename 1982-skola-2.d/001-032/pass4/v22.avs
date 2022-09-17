/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v22 = LSMASHVideoSource(dst_dir + "v22rc.mp4")
v22 = ImageSource(file = dst_dir + "v22-png\v22-%04d copy.png", pixel_type="RGB48", start=0, end=57, fps=18)
#v22 = v22.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v22 = v22.convertToY
v22 = v22.adjustSize

#v22 = v22.extractY.convertToYV12(interlaced=false)
#v22 = v22.deScratch.extractY

v22 = v22.Filter(th_SAD=300, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v22 = v22.convertBits(8)

v22 = v22.convertToYV12(interlaced=false)
#v22 = v22.autolevels
#return v22.histogram("levels")
v22 = v22.deScratch.extractY
v22 = v22.removeDirt
v22 = v22.convertToYV12(interlaced=false)
v22 = v22.UnsharpMask(strength=300, radius=5, threshold=1)
v22 = v22.adjustBorders
#v22 = v22.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v22 = v22.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v22_0 = LSMASHVideoSource(dst_dir + "v22r-0.mp4")
#v22 = v22_0.interleave(v22)

va = BlankClip(v22, audio_rate = 48000, channels = 2).killVideo
v22 = v22.audioDub(va)

return v22.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v22 = LSMASHVideoSource(dst_dir + "v22rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v22f.mp4")
v22 = ImageSource(file = dst_dir + "v22-png\v22-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v22 = v22.convertToY.adjustSize

#v22 = v22.extractY.convertToYV12(interlaced=false)
#v22 = v22.deScratch.extractY

v22 = v22.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v22 = v22.convertBits(8).convertToYV12(interlaced=false)

v22 = v22.deScratch.extractY
v22 = v22.removeDirt
v22 = v22.convertToYV12(interlaced=false)
v22 = v22.UnsharpMask(strength=400, radius=5, threshold=1)
v22 = v22.adjustBorders
#v22 = v22.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v22 = v22.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v22, audio_rate = 48000, channels = 2).killVideo
v22 = v22.audioDub(va)

return v22.Prefetch

