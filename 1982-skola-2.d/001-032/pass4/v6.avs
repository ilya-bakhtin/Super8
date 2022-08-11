LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v6 = LSMASHVideoSource(dst_dir + "v6rc.mp4")
v6 = ImageSource(file = dst_dir + "v06-png\v6-%04d copy.png", pixel_type="RGB48", start=0, end=374, fps=18)
v6 = v6.autolevels(filterRadius=0, ignore_low = 0.009, ignore_high=0.0003)
v6 = v6.convertToY
v6 = v6.adjustSize

#v6 = v6.extractY.convertToYV12(interlaced=false)
#v6 = v6.deScratch.extractY

v6 = v6.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v6 = v6.convertBits(8)

v6 = v6.convertToYV12(interlaced=false)
#v6 = v6.autolevels
#return v6.histogram("levels")
v6 = v6.deScratch.extractY
v6 = v6.removeDirt
v6 = v6.convertToYV12(interlaced=false)
v6 = v6.UnsharpMask(strength=500, radius=7, threshold=1)
v6 = v6.adjustBorders
#v6 = v6.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v6 = v6.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

#v6_0 = LSMASHVideoSource(dst_dir + "v6r-0.mp4")
#v6 = v6_0.interleave(v6)

va = BlankClip(v6, audio_rate = 48000, channels = 2).killVideo
v6 = v6.audioDub(va)

return v6.Prefetch

