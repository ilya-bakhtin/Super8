/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v15 = LSMASHVideoSource(dst_dir + "v15rc.mp4")
v15 = ImageSource(file = dst_dir + "v15-png\v15-%04d copy.png", pixel_type="RGB48", start=0, end=78, fps=18)
#v15 = v15.autolevels(filterRadius=0, ignore_low = 0.009, ignore_high=0.0003)
v15 = v15.convertToY
v15 = v15.adjustSize

#v15 = v15.extractY.convertToYV12(interlaced=false)
#v15 = v15.deScratch.extractY

v15 = v15.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v15 = v15.convertBits(8)

v15 = v15.convertToYV12(interlaced=false)
#v15 = v15.autolevels
#return v15.histogram("levels")
v15 = v15.deScratch.extractY
v15 = v15.removeDirt
v15 = v15.convertToYV12(interlaced=false)
v15 = v15.UnsharpMask(strength=400, radius=5, threshold=1)
v15 = v15.adjustBorders
#v15 = v15.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v15 = v15.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v15_0 = LSMASHVideoSource(dst_dir + "v15r-0.mp4")
#v15 = v15_0.interleave(v15)

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

return v15.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v15 = LSMASHVideoSource(dst_dir + "v15rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v15f.mp4")
v15 = ImageSource(file = dst_dir + "v15-png\v15-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v15 = v15.convertToY.adjustSize

#v15 = v15.extractY.convertToYV12(interlaced=false)
#v15 = v15.deScratch.extractY

v15 = v15.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v15 = v15.convertBits(8).convertToYV12(interlaced=false)

v15 = v15.deScratch.extractY
v15 = v15.removeDirt
v15 = v15.convertToYV12(interlaced=false)
v15 = v15.UnsharpMask(strength=400, radius=5, threshold=1)
v15 = v15.adjustBorders
#v15 = v15.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v15 = v15.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

return v15.Prefetch
