LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v7 = LSMASHVideoSource(dst_dir + "v7rc.mp4")
v7 = v7.extractY.convertToYV12(interlaced=false)
v7 = v7.deScratch.extractY

#v7 = v7.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v7 = v7.removeDirt
v7 = v7.convertToYV12(interlaced=false)
v7 = v7.UnsharpMask(strength=400, radius=5, threshold=1)
v7 = v7.adjustBorders
#v7 = v7.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v7 = v7.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v7.Prefetch

