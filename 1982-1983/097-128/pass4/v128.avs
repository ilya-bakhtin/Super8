LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v128 = LWLibavVideoSource(source_dir + "v128rc.avi", cache=false)
v128 = v128.convertToYV24(interlaced=false)

v128 = v128.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v128 = v128.removeDirt
v128 = v128.convertToYV12
v128 = v128.UnsharpMask(strength=300, radius=5, threshold=1)
v128 = v128.adjustBorders
v128 = v128.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v128.Prefetch(12)

