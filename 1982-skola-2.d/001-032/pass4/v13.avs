LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v13 = LSMASHVideoSource(dst_dir + "v13rc.mp4")
v13 = v13.extractY.convertToYV12(interlaced=false)
v13 = v13.deScratch.extractY

#v13 = v13.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v13 = v13.removeDirt
v13 = v13.convertToYV12(interlaced=false)
v13 = v13.UnsharpMask(strength=400, radius=5, threshold=1)
v13 = v13.adjustBorders
#v13 = v13.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v13 = v13.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v13.Prefetch

