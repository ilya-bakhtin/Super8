LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v4 = LSMASHVideoSource(dst_dir + "v4rc.mp4")
v4 = ImageSource(file = dst_dir + "v04-png\v4%04d copy.png", pixel_type="RGB48", start=0, end=410, fps=18)
v4 = v4.autolevels(filterRadius=0, ignore_low=0.001, ignore_high=0.001)
v4 = v4.convertToY
v4 = v4.adjustSize

#v4 = v4.extractY.convertToYV12(interlaced=false)
#v4 = v4.deScratch.extractY

v4 = v4.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v4 = v4.convertBits(8)

v4 = v4.convertToYV12(interlaced=false)
#v4 = v4.autolevels(filterRadius=0, ignore_low=0.001, ignore_high=0.001)
#return v4.histogram("levels")
v4 = v4.deScratch.extractY
v4 = v4.removeDirt
v4 = v4.convertToYV12(interlaced=false)
v4 = v4.UnsharpMask(strength=400, radius=7, threshold=1)
v4 = v4.adjustBorders
#v4 = v4.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v4 = v4.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v4, audio_rate = 48000, channels = 2).killVideo
v4 = v4.audioDub(va)

return v4.Prefetch

