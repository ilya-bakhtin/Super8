LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v188 = LWLibavVideoSource(source_dir + "v188rc.avi", cache=false)
v188 = v188.convertToYV24(interlaced=false)

v188 = v188.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v188 = v188.removeDirt
v188 = v188.convertToYV12
v188 = v188.UnsharpMask(strength=300, radius=5, threshold=1)
v188 = v188.adjustBorders
v188 = v188.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v188.Prefetch(12)

