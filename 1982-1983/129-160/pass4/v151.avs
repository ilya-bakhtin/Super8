LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v151 = LWLibavVideoSource(source_dir + "v151rc.avi", cache=false)
v151 = v151.convertToYV24(interlaced=false)

v151 = v151.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v151 = v151.removeDirt
v151 = v151.convertToYV12
v151 = v151.UnsharpMask(strength=300, radius=5, threshold=1)
v151 = v151.adjustBorders
v151 = v151.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v151.Prefetch(12)

