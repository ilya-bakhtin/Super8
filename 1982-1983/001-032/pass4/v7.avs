LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v7 = LWLibavVideoSource(source_dir + "v7rc.avi", cache=false)
v7 = v7.convertToYV24(interlaced=false)

v7 = v7.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v7 = v7.removeDirt
v7 = v7.convertToYV12
v7 = v7.UnsharpMask(strength=300, radius=5, threshold=1)
v7 = v7.adjustBorders
v7 = v7.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v7.Prefetch(12)

