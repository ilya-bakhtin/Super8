LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v84 = LWLibavVideoSource(source_dir + "v84rc.avi", cache=false)
v84 = v84.convertToYV24(interlaced=false)

v84 = v84.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v84 = v84.removeDirt
v84 = v84.convertToYV12
v84 = v84.UnsharpMask(strength=300, radius=5, threshold=1)
v84 = v84.adjustBorders
v84 = v84.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v84.Prefetch(12)

