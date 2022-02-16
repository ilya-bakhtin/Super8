LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v116 = LWLibavVideoSource(source_dir + "v116rc.avi", cache=false)
v116 = v116.convertToYV24(interlaced=false)

v116 = v116.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v116 = v116.removeDirt
v116 = v116.convertToYV12
v116 = v116.UnsharpMask(strength=300, radius=5, threshold=1)
v116 = v116.adjustBorders
v116 = v116.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v116.Prefetch(12)

