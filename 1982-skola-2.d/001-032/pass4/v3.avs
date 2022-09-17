/*
LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v3 = LSMASHVideoSource(dst_dir + "v3rc.mp4")
v3 = v3.extractY.convertToYV12(interlaced=false)
v3 = v3.deScratch.extractY

#v3 = v3.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v3 = v3.removeDirt
v3 = v3.convertToYV12(interlaced=false)
v3 = v3.UnsharpMask(strength=400, radius=5, threshold=1)
v3 = v3.adjustBorders
#v3 = v3.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v3 = v3.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v3.Prefetch
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v03 = LSMASHVideoSource(dst_dir + "v03rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v3f.mp4")
v03 = ImageSource(file = dst_dir + "v03-png\v03-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v03 = v03.convertToY.adjustSize

#v03 = v03.extractY.convertToYV12(interlaced=false)
#v03 = v03.deScratch.extractY

v03 = v03.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v03 = v03.convertBits(8).convertToYV12(interlaced=false)

v03 = v03.deScratch.extractY
v03 = v03.removeDirt
v03 = v03.convertToYV12(interlaced=false)
v03 = v03.UnsharpMask(strength=400, radius=5, threshold=1)
v03 = v03.adjustBorders
#v03 = v03.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v03 = v03.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v03, audio_rate = 48000, channels = 2).killVideo
v03 = v03.audioDub(va)

return v03.Prefetch
