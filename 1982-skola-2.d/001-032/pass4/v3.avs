LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
v3 = LSMASHVideoSource(dst_dir + "v3rc.mp4")
v3 = v3.extractY.convertToYV12(interlaced=false)
v3 = v3.deScratch.extractY

#v3 = v3.Filter(th_SAD=200, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v3 = v3.removeDirt
v3 = v3.convertToYV12(interlaced=false)
v3 = v3.UnsharpMask(strength=400, radius=5, threshold=1)
v3 = v3.adjustBorders
#v3 = v3.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v3 = v3.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v3.Prefetch

