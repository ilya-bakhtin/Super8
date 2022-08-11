LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v2 = LSMASHVideoSource(dst_dir + "v2rc.mp4")
v2 = v2.extractY.convertToYV12(interlaced=false)
v2 = v2.deScratch.extractY

#v2 = v2.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v2 = v2.removeDirt
v2 = v2.convertToYV12(interlaced=false)
v2 = v2.UnsharpMask(strength=400, radius=5, threshold=1)
v2 = v2.adjustBorders
#v2 = v2.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v2 = v2.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v2.Prefetch

