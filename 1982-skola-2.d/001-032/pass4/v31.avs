/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v31 = LSMASHVideoSource(dst_dir + "v31rc.mp4")
v31 = ImageSource(file = dst_dir + "v31-png\v31-%04d copy.png", pixel_type="RGB48", start=0, end=57, fps=18)
#v31 = v31.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v31 = v31.convertToY
v31 = v31.adjustSize

#v31 = v31.extractY.convertToYV12(interlaced=false)
#v31 = v31.deScratch.extractY

v31 = v31.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v31 = v31.convertBits(8)

v31 = v31.convertToYV12(interlaced=false)
#v31 = v31.autolevels
#return v31.histogram("levels")
v31 = v31.deScratch.extractY
v31 = v31.removeDirt
v31 = v31.convertToYV12(interlaced=false)
v31 = v31.UnsharpMask(strength=400, radius=5, threshold=1)
v31 = v31.adjustBorders
#v31 = v31.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v31 = v31.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v31_0 = LSMASHVideoSource(dst_dir + "v31r-0.mp4")
#v31 = v31_0.interleave(v31)

va = BlankClip(v31, audio_rate = 48000, channels = 2).killVideo
v31 = v31.audioDub(va)

return v31.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v31 = LSMASHVideoSource(dst_dir + "v31rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v31f.mp4")
v31 = ImageSource(file = dst_dir + "v31-png\v31-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v31 = v31.convertToY.adjustSize

#v31 = v31.extractY.convertToYV12(interlaced=false)
#v31 = v31.deScratch.extractY

v31 = v31.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v31 = v31.convertBits(8).convertToYV12(interlaced=false)

v31 = v31.deScratch.extractY
v31 = v31.removeDirt
v31 = v31.convertToYV12(interlaced=false)
v31 = v31.UnsharpMask(strength=400, radius=5, threshold=1)
v31 = v31.adjustBorders
#v31 = v31.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v31 = v31.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v31, audio_rate = 48000, channels = 2).killVideo
v31 = v31.audioDub(va)

return v31.Prefetch
