LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v27 = LSMASHVideoSource(dst_dir + "v27rc.mp4")
v27 = ImageSource(file = dst_dir + "v27-png\v27-%04d copy.png", pixel_type="RGB48", start=0, end=87, fps=18)
#v27 = v27.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v27 = v27.convertToY
v27 = v27.adjustSize

#v27 = v27.extractY.convertToYV12(interlaced=false)
#v27 = v27.deScratch.extractY

v27 = v27.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v27 = v27.convertBits(8)

v27 = v27.convertToYV12(interlaced=false)
#v27 = v27.autolevels
#return v27.histogram("levels")
v27 = v27.deScratch.extractY
v27 = v27.removeDirt
v27 = v27.convertToYV12(interlaced=false)
v27 = v27.UnsharpMask(strength=400, radius=5, threshold=1)
v27 = v27.adjustBorders
#v27 = v27.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v27 = v27.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v27_0 = LSMASHVideoSource(dst_dir + "v27r-0.mp4")
#v27 = v27_0.interleave(v27)

va = BlankClip(v27, audio_rate = 48000, channels = 2).killVideo
v27 = v27.audioDub(va)

return v27.Prefetch

