LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v10 = LSMASHVideoSource(dst_dir + "v10rc.mp4")
v10 = ImageSource(file = dst_dir + "v10-png\v10-%04d copy.png", pixel_type="RGB48", start=0, end=34, fps=18)
#v10 = v10.autolevels
v10 = v10.convertToY
v10 = v10.adjustSize

#v10 = v10.extractY.convertToYV12(interlaced=false)
#v10 = v10.deScratch.extractY

v10 = v10.Filter(th_SAD=400, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v10 = v10.convertBits(8)

v10 = v10.convertToYV12(interlaced=false)
#v10 = v10.autolevels
#eturn v10.histogram("levels")
v10 = v10.deScratch.extractY
v10 = v10.removeDirt
v10 = v10.convertToYV12(interlaced=false)
v10 = v10.UnsharpMask(strength=400, radius=3, threshold=1)
v10 = v10.adjustBorders
#v10 = v10.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v10 = v10.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v10, audio_rate = 48000, channels = 2).killVideo
v10 = v10.audioDub(va)

return v10.Prefetch

