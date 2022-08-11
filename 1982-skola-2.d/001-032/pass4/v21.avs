LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v21 = LSMASHVideoSource(dst_dir + "v21rc.mp4")
v21 = ImageSource(file = dst_dir + "v21-png\v21-%04d copy.png", pixel_type="RGB48", start=0, end=170, fps=18)
v21 = v21.autolevels(filterRadius=0, ignore_low = 0.0009, ignore_high=0.0003)
v21 = v21.convertToY
v21 = v21.adjustSize

#v21 = v21.extractY.convertToYV12(interlaced=false)
#v21 = v21.deScratch.extractY

v21 = v21.Filter(th_SAD=300, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v21 = v21.convertBits(8)

v21 = v21.convertToYV12(interlaced=false)
#v21 = v21.autolevels
#return v21.histogram("levels")
v21 = v21.deScratch.extractY
v21 = v21.removeDirt
v21 = v21.convertToYV12(interlaced=false)
v21 = v21.UnsharpMask(strength=400, radius=5, threshold=1)
v21 = v21.adjustBorders
#v21 = v21.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v21 = v21.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v21_0 = LSMASHVideoSource(dst_dir + "v21r-0.mp4")
#v21 = v21_0.interleave(v21)

va = BlankClip(v21, audio_rate = 48000, channels = 2).killVideo
v21 = v21.audioDub(va)

return v21.Prefetch

