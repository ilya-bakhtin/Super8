/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v9 = LSMASHVideoSource(dst_dir + "v9rc.mp4")
v9 = v9.extractY.convertToYV12(interlaced=false)
v9 = v9.deScratch.extractY

#v9 = v9.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v9 = v9.removeDirt
v9 = v9.convertToYV12(interlaced=false)
v9 = v9.UnsharpMask(strength=400, radius=5, threshold=1)
v9 = v9.adjustBorders
#v9 = v9.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v9 = v9.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v9.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v09 = LSMASHVideoSource(dst_dir + "v09rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v9f.mp4")
v09 = ImageSource(file = dst_dir + "v09-png\v09-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v09 = v09.convertToY.adjustSize

#v09 = v09.extractY.convertToYV12(interlaced=false)
#v09 = v09.deScratch.extractY

v09 = v09.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v09 = v09.convertBits(8).convertToYV12(interlaced=false)

v09 = v09.deScratch.extractY
v09 = v09.removeDirt
v09 = v09.convertToYV12(interlaced=false)
v09 = v09.UnsharpMask(strength=400, radius=5, threshold=1)
v09 = v09.adjustBorders
#v09 = v09.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v09 = v09.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v09, audio_rate = 48000, channels = 2).killVideo
v09 = v09.audioDub(va)

return v09.Prefetch
