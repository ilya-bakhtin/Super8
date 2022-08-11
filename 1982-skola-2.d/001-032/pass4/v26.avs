LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v26 = ImageSource(file = dst_dir + "v26-png\v26%04d copy.png", pixel_type="RGB48", start=0, end=55, fps=18)
v26 = v26.autolevels(filterRadius=0, ignore_low=0.0003, ignore_high=0.0003)
v26 = v26.convertToY
#return v26.autolevels.info.convertBits(8).convertToYV12.histogram("levels")
#v26 = LSMASHVideoSource(dst_dir + "v26rc.mp4")
#v26 = v26.convertBits(8).convertToYV12(interlaced=false)
#v26 = v26.extractY.convertToYV12(interlaced=false)

v26 = v26.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v26 = v26.convertBits(8)
v26 = v26.convertToYV12(interlaced=false)
#return v26.histogram("levels")
v26 = v26.deScratch
v26 = v26.removeDirt
v26 = v26.UnsharpMask(strength=400, radius=5, threshold=1)
v26 = v26.adjustBorders
#v26 = v26.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v26 = v26.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v26r = LSMASHVideoSource(dst_dir + "v26r-0.mp4")
#v26 = v26r.interleave(v26)

va = BlankClip(v26, audio_rate = 48000, channels = 2).killVideo
v26 = v26.audioDub(va)

return v26.Prefetch

