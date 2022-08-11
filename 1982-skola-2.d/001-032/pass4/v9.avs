LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v9 = LSMASHVideoSource(dst_dir + "v9rc.mp4")
v9 = v9.extractY.convertToYV12(interlaced=false)
v9 = v9.deScratch.extractY

#v9 = v9.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v9 = v9.removeDirt
v9 = v9.convertToYV12(interlaced=false)
v9 = v9.UnsharpMask(strength=400, radius=5, threshold=1)
v9 = v9.adjustBorders
#v9 = v9.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v9 = v9.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v9.Prefetch

