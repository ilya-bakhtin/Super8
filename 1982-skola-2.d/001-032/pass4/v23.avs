LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v23 = LSMASHVideoSource(dst_dir + "v23rc.mp4")
v23 = ImageSource(file = dst_dir + "v23-png\v23-%04d copy.png", pixel_type="RGB48", start=0, end=84, fps=18)
v23 = v23.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v23 = v23.convertToY
v23 = v23.adjustSize

#v23 = v23.extractY.convertToYV12(interlaced=false)
#v23 = v23.deScratch.extractY

v23 = v23.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v23 = v23.convertBits(8)

v23 = v23.convertToYV12(interlaced=false)
#v23 = v23.autolevels
#return v23.histogram("levels")
v23 = v23.deScratch.extractY
v23 = v23.removeDirt
v23 = v23.convertToYV12(interlaced=false)
v23 = v23.UnsharpMask(strength=400, radius=5, threshold=1)
v23 = v23.adjustBorders
#v23 = v23.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v23 = v23.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v23_0 = LSMASHVideoSource(dst_dir + "v23r-0.mp4")
#v23 = v23_0.interleave(v23)

va = BlankClip(v23, audio_rate = 48000, channels = 2).killVideo
v23 = v23.audioDub(va)

return v23.Prefetch

