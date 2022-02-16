LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v20 = LWLibavVideoSource(source_dir + "v20rc.avi", cache=false)
v20 = v20.convertToYV24(interlaced=false)

v20 = v20.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v20 = v20.removeDirt
v20 = v20.convertToYV12
v20 = v20.UnsharpMask(strength=300, radius=5, threshold=1)
v20 = v20.adjustBorders
v20 = v20.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v20.Prefetch(12)

