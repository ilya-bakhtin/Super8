LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v83 = LWLibavVideoSource(source_dir + "v83rc.avi", cache=false)
v83 = v83.convertToYV24(interlaced=false)

v83 = v83.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v83 = v83.removeDirt
v83 = v83.convertToYV12
v83 = v83.UnsharpMask(strength=300, radius=5, threshold=1)
v83 = v83.adjustBorders
v83 = v83.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v83.Prefetch(12)

