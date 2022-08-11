LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v14 = LSMASHVideoSource(dst_dir + "v14rc.mp4")
v14 = v14.extractY.convertToYV12(interlaced=false)
v14 = v14.deScratch.extractY

#v14 = v14.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v14 = v14.removeDirt
v14 = v14.convertToYV12(interlaced=false)
v14 = v14.UnsharpMask(strength=400, radius=5, threshold=1)
v14 = v14.adjustBorders
#v14 = v14.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v14 = v14.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v14.Prefetch

