LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v32 = LSMASHVideoSource(dst_dir + "v32rc.mp4")
v32 = ImageSource(file = dst_dir + "v32-png\v32-%04d copy.png", pixel_type="RGB48", start=0, end=51, fps=18)
#v32 = v32.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v32 = v32.convertToY
v32 = v32.adjustSize

#v32 = v32.extractY.convertToYV12(interlaced=false)
#v32 = v32.deScratch.extractY

v32 = v32.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v32 = v32.convertBits(8)

v32 = v32.convertToYV12(interlaced=false)
#v32 = v32.autolevels
#return v32.histogram("levels")
v32 = v32.deScratch.extractY
v32 = v32.removeDirt
v32 = v32.convertToYV12(interlaced=false)
v32 = v32.UnsharpMask(strength=400, radius=5, threshold=1)
v32 = v32.adjustBorders
#v32 = v32.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v32 = v32.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v32_0 = LSMASHVideoSource(dst_dir + "v32r-0.mp4")
#v32 = v32_0.interleave(v32)

va = BlankClip(v32, audio_rate = 48000, channels = 2).killVideo
v32 = v32.audioDub(va)

return v32.Prefetch

