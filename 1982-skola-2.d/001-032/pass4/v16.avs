LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v16 = LSMASHVideoSource(dst_dir + "v16rc.mp4")
v16 = ImageSource(file = dst_dir + "v16-png\v16-%04d copy.png", pixel_type="RGB48", start=0, end=187, fps=18)
#v16 = v16.autolevels(filterRadius=0, ignore_low = 0.009, ignore_high=0.0003)
v16 = v16.convertToY
v16 = v16.adjustSize

#v16 = v16.extractY.convertToYV12(interlaced=false)
#v16 = v16.deScratch.extractY

v16 = v16.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v16 = v16.convertBits(8)

v16 = v16.convertToYV12(interlaced=false)
#v16 = v16.autolevels
#return v16.histogram("levels")
v16 = v16.deScratch.extractY
v16 = v16.removeDirt
v16 = v16.convertToYV12(interlaced=false)
v16 = v16.UnsharpMask(strength=400, radius=5, threshold=1)
v16 = v16.adjustBorders
#v16 = v16.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v16 = v16.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v16_0 = LSMASHVideoSource(dst_dir + "v16r-0.mp4")
#v16 = v16_0.interleave(v16)

va = BlankClip(v16, audio_rate = 48000, channels = 2).killVideo
v16 = v16.audioDub(va)

return v16.Prefetch

