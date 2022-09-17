/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v1 = LSMASHVideoSource(dst_dir + "v1rc.mp4")
v1 = v1.extractY.convertToYV12(interlaced=false)
v1 = v1.deScratch.extractY

#v1 = v1.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v1 = v1.removeDirt
v1 = v1.convertToYV12(interlaced=false)
v1 = v1.UnsharpMask(strength=400, radius=5, threshold=1)
v1 = v1.adjustBorders
#v1 = v1.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v1 = v1.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v1.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v01 = LSMASHVideoSource(dst_dir + "v01rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v1f.mp4")
v01 = ImageSource(file = dst_dir + "v01-png\v01-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v01 = v01.convertToY.adjustSize

#v01 = v01.extractY.convertToYV12(interlaced=false)
#v01 = v01.deScratch.extractY

v01 = v01.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v01 = v01.convertBits(8).convertToYV12(interlaced=false)

v01 = v01.deScratch.extractY
v01 = v01.removeDirt
v01 = v01.convertToYV12(interlaced=false)
v01 = v01.UnsharpMask(strength=400, radius=5, threshold=1)
v01 = v01.adjustBorders
#v01 = v01.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v01 = v01.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v01, audio_rate = 48000, channels = 2).killVideo
v01 = v01.audioDub(va)

return v01.Prefetch
