LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v25 = LSMASHVideoSource(dst_dir + "v25rc.mp4")
v25 = ImageSource(file = dst_dir + "v25-png\v25-%04d copy.png", pixel_type="RGB48", start=0, end=80, fps=18)
#v25 = v25.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v25 = v25.convertToY
v25 = v25.adjustSize

#v25 = v25.extractY.convertToYV12(interlaced=false)
#v25 = v25.deScratch.extractY

v25 = v25.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v25 = v25.convertBits(8)

v25 = v25.convertToYV12(interlaced=false)
#v25 = v25.autolevels
#return v25.histogram("levels")
v25 = v25.deScratch.extractY
v25 = v25.removeDirt
v25 = v25.convertToYV12(interlaced=false)
v25 = v25.UnsharpMask(strength=400, radius=5, threshold=1)
v25 = v25.adjustBorders
#v25 = v25.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v25 = v25.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v25_0 = LSMASHVideoSource(dst_dir + "v25r-0.mp4")
#v25 = v25_0.interleave(v25)

va = BlankClip(v25, audio_rate = 48000, channels = 2).killVideo
v25 = v25.audioDub(va)

return v25.Prefetch

