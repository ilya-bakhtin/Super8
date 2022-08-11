LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v20 = LSMASHVideoSource(dst_dir + "v20rc.mp4")
v20 = ImageSource(file = dst_dir + "v20-png\v20-%04d copy.png", pixel_type="RGB48", start=0, end=25, fps=18)
#v20 = v20.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v20 = v20.convertToY
v20 = v20.adjustSize

#v20 = v20.extractY.convertToYV12(interlaced=false)
#v20 = v20.deScratch.extractY

v20 = v20.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v20 = v20.convertBits(8)

v20 = v20.convertToYV12(interlaced=false)
#v20 = v20.autolevels
#return v20.histogram("levels")
v20 = v20.deScratch.extractY
v20 = v20.removeDirt
v20 = v20.convertToYV12(interlaced=false)
v20 = v20.UnsharpMask(strength=400, radius=5, threshold=1)
v20 = v20.adjustBorders
#v20 = v20.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v20 = v20.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v20_0 = LSMASHVideoSource(dst_dir + "v20r-0.mp4")
#v20 = v20_0.interleave(v20)

va = BlankClip(v20, audio_rate = 48000, channels = 2).killVideo
v20 = v20.audioDub(va)

return v20.Prefetch

