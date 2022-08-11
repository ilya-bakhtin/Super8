LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v18 = LSMASHVideoSource(dst_dir + "v18rc.mp4")
v18 = ImageSource(file = dst_dir + "v18-png\v18-%04d copy.png", pixel_type="RGB48", start=0, end=18, fps=18)
#v18 = v18.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v18 = v18.convertToY
v18 = v18.adjustSize

#v18 = v18.extractY.convertToYV12(interlaced=false)
#v18 = v18.deScratch.extractY

v18 = v18.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v18 = v18.convertBits(8)

v18 = v18.convertToYV12(interlaced=false)
#v18 = v18.autolevels
#return v18.histogram("levels")
v18 = v18.deScratch.extractY
v18 = v18.removeDirt
v18 = v18.convertToYV12(interlaced=false)
v18 = v18.UnsharpMask(strength=400, radius=5, threshold=1)
v18 = v18.adjustBorders
#v18 = v18.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v18 = v18.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v18_0 = LSMASHVideoSource(dst_dir + "v18r-0.mp4")
#v18 = v18_0.interleave(v18)

va = BlankClip(v18, audio_rate = 48000, channels = 2).killVideo
v18 = v18.audioDub(va)

return v18.Prefetch

