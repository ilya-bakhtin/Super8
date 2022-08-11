LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v14 = LSMASHVideoSource(dst_dir + "v14rc.mp4")
v14 = ImageSource(file = dst_dir + "v14-png\v14-%04d copy.png", pixel_type="RGB48", start=0, end=31, fps=18)
v14 = v14.autolevels(filterRadius=0, ignore_low = 0.009, ignore_high=0.0003)
v14 = v14.convertToY
v14 = v14.adjustSize

#v14 = v14.extractY.convertToYV12(interlaced=false)
#v14 = v14.deScratch.extractY

v14 = v14.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v14 = v14.convertBits(8)

v14 = v14.convertToYV12(interlaced=false)
#v14 = v14.autolevels
#return v14.histogram("levels")
v14 = v14.deScratch.extractY
v14 = v14.removeDirt
v14 = v14.convertToYV12(interlaced=false)
v14 = v14.UnsharpMask(strength=400, radius=3, threshold=1)
v14 = v14.adjustBorders
#v14 = v14.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v14 = v14.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v14_0 = LSMASHVideoSource(dst_dir + "v14r-0.mp4")
#v14 = v14_0.interleave(v14)

va = BlankClip(v14, audio_rate = 48000, channels = 2).killVideo
v14 = v14.audioDub(va)

return v14.Prefetch

