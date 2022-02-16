LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v121 = LWLibavVideoSource(source_dir + "v121rc.avi", cache=false)
v121 = v121.convertToYV24(interlaced=false)

v121 = v121.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v121 = v121.removeDirt
v121 = v121.convertToYV12
v121 = v121.UnsharpMask(strength=300, radius=5, threshold=1)
v121 = v121.adjustBorders
v121 = v121.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v121.Prefetch(12)

