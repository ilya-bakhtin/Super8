LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v28 = LSMASHVideoSource(dst_dir + "v28rc.mp4")
v28 = ImageSource(file = dst_dir + "v28-png\v28-%04d copy.png", pixel_type="RGB48", start=0, end=88, fps=18)
#v28 = v28.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v28 = v28.convertToY
v28 = v28.adjustSize

#v28 = v28.extractY.convertToYV12(interlaced=false)
#v28 = v28.deScratch.extractY

v28 = v28.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v28 = v28.convertBits(8)

v28 = v28.convertToYV12(interlaced=false)
#v28 = v28.autolevels
#return v28.histogram("levels")
v28 = v28.deScratch.extractY
v28 = v28.removeDirt
v28 = v28.convertToYV12(interlaced=false)
v28 = v28.UnsharpMask(strength=400, radius=5, threshold=1)
v28 = v28.adjustBorders
#v28 = v28.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v28 = v28.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v28_0 = LSMASHVideoSource(dst_dir + "v28r-0.mp4")
#v28 = v28_0.interleave(v28)

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

return v28.Prefetch

