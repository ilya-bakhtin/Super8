LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v17 = LSMASHVideoSource(dst_dir + "v17rc.mp4")
v17 = ImageSource(file = dst_dir + "v17-png\v17-%04d copy.png", pixel_type="RGB48", start=0, end=89, fps=18)
v17 = v17.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v17 = v17.convertToY
v17 = v17.adjustSize

#v17 = v17.extractY.convertToYV12(interlaced=false)
#v17 = v17.deScratch.extractY

v17 = v17.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v17 = v17.convertBits(8)

v17 = v17.convertToYV12(interlaced=false)
#v17 = v17.autolevels
#return v17.histogram("levels")
v17 = v17.deScratch.extractY
v17 = v17.removeDirt
v17 = v17.convertToYV12(interlaced=false)
v17 = v17.UnsharpMask(strength=400, radius=5, threshold=1)
v17 = v17.adjustBorders
#v17 = v17.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v17 = v17.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v17_0 = LSMASHVideoSource(dst_dir + "v17r-0.mp4")
#v17 = v17_0.interleave(v17)

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

return v17.Prefetch

