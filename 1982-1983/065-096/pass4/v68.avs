LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v68 = LWLibavVideoSource(source_dir + "v68rc.avi", cache=false)
v68 = v68.convertToYV24(interlaced=false)

v68 = v68.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v68 = v68.removeDirt
v68 = v68.convertToYV12
v68 = v68.UnsharpMask(strength=300, radius=5, threshold=1)
v68 = v68.adjustBorders
v68 = v68.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v68.Prefetch(12)

