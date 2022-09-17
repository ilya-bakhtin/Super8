/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v8 = LSMASHVideoSource(dst_dir + "v8rc.mp4")
v8 = v8.extractY.convertToYV12(interlaced=false)
v8 = v8.deScratch.extractY

#v8 = v8.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v8 = v8.removeDirt
v8 = v8.convertToYV12(interlaced=false)
v8 = v8.UnsharpMask(strength=400, radius=5, threshold=1)
v8 = v8.adjustBorders
#v8 = v8.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v8 = v8.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v8.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v08 = LSMASHVideoSource(dst_dir + "v08rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v8f.mp4")
v08 = ImageSource(file = dst_dir + "v08-png\v08-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v08 = v08.convertToY.adjustSize

#v08 = v08.extractY.convertToYV12(interlaced=false)
#v08 = v08.deScratch.extractY

v08 = v08.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v08 = v08.convertBits(8).convertToYV12(interlaced=false)

v08 = v08.deScratch.extractY
v08 = v08.removeDirt
v08 = v08.convertToYV12(interlaced=false)
v08 = v08.UnsharpMask(strength=400, radius=5, threshold=1)
v08 = v08.adjustBorders
#v08 = v08.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v08 = v08.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v08, audio_rate = 48000, channels = 2).killVideo
v08 = v08.audioDub(va)

return v08.Prefetch
