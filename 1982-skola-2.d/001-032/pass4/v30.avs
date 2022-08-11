LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v30 = LSMASHVideoSource(dst_dir + "v30rc.mp4")
v30 = ImageSource(file = dst_dir + "v30-png\v30-%04d copy.png", pixel_type="RGB48", start=0, end=36, fps=18)
v30 = v30.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v30 = v30.convertToY
v30 = v30.adjustSize

#v30 = v30.extractY.convertToYV12(interlaced=false)
#v30 = v30.deScratch.extractY

v30 = v30.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v30 = v30.convertBits(8)

v30 = v30.convertToYV12(interlaced=false)
#v30 = v30.autolevels
#return v30.histogram("levels")
v30 = v30.deScratch.extractY
v30 = v30.removeDirt
v30 = v30.convertToYV12(interlaced=false)
v30 = v30.UnsharpMask(strength=400, radius=5, threshold=1)
v30 = v30.adjustBorders
#v30 = v30.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v30 = v30.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v30_0 = LSMASHVideoSource(dst_dir + "v30r-0.mp4")
#v30 = v30_0.interleave(v30)

va = BlankClip(v30, audio_rate = 48000, channels = 2).killVideo
v30 = v30.audioDub(va)

return v30.Prefetch

