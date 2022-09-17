/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v29 = LSMASHVideoSource(dst_dir + "v29rc.mp4")
v29 = ImageSource(file = dst_dir + "v29-png\v29-%04d copy.png", pixel_type="RGB48", start=0, end=96, fps=18)
v29 = v29.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v29 = v29.convertToY
v29 = v29.adjustSize

#v29 = v29.extractY.convertToYV12(interlaced=false)
#v29 = v29.deScratch.extractY

v29 = v29.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v29 = v29.convertBits(8)

v29 = v29.convertToYV12(interlaced=false)
#v29 = v29.autolevels
#return v29.histogram("levels")
v29 = v29.deScratch.extractY
v29 = v29.removeDirt
v29 = v29.convertToYV12(interlaced=false)
v29 = v29.UnsharpMask(strength=400, radius=5, threshold=1)
v29 = v29.adjustBorders
#v29 = v29.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v29 = v29.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v29_0 = LSMASHVideoSource(dst_dir + "v29r-0.mp4")
#v29 = v29_0.interleave(v29)

va = BlankClip(v29, audio_rate = 48000, channels = 2).killVideo
v29 = v29.audioDub(va)

return v29.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v29 = LSMASHVideoSource(dst_dir + "v29rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v29f.mp4")
v29 = ImageSource(file = dst_dir + "v29-png\v29-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v29 = v29.convertToY.adjustSize

#v29 = v29.extractY.convertToYV12(interlaced=false)
#v29 = v29.deScratch.extractY

v29 = v29.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v29 = v29.convertBits(8).convertToYV12(interlaced=false)

v29 = v29.deScratch.extractY
v29 = v29.removeDirt
v29 = v29.convertToYV12(interlaced=false)
v29 = v29.UnsharpMask(strength=400, radius=5, threshold=1)
v29 = v29.adjustBorders
#v29 = v29.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v29 = v29.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v29, audio_rate = 48000, channels = 2).killVideo
v29 = v29.audioDub(va)

return v29.Prefetch
