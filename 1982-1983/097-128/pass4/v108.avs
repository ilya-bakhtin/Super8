LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v108 = LWLibavVideoSource(source_dir + "v108rc.avi", cache=false)
v108 = v108.convertToYV24(interlaced=false)

v108 = v108.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v108 = v108.removeDirt
v108 = v108.convertToYV12
v108 = v108.UnsharpMask(strength=300, radius=5, threshold=1)
v108 = v108.adjustBorders
v108 = v108.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v108.Prefetch(12)

