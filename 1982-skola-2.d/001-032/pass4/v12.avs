LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v12 = LSMASHVideoSource(dst_dir + "v12rc.mp4")
v12 = v12.extractY.convertToYV12(interlaced=false)
v12 = v12.deScratch.extractY

#v12 = v12.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v12 = v12.removeDirt
v12 = v12.convertToYV12(interlaced=false)
v12 = v12.UnsharpMask(strength=400, radius=5, threshold=1)
v12 = v12.adjustBorders
#v12 = v12.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v12 = v12.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v12.Prefetch

