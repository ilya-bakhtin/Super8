LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v55 = LWLibavVideoSource(source_dir + "v55rc.avi", cache=false)
v55 = v55.convertToYV24(interlaced=false)

v55 = v55.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v55 = v55.removeDirt
v55 = v55.convertToYV12
v55 = v55.UnsharpMask(strength=300, radius=5, threshold=1)
v55 = v55.adjustBorders
v55 = v55.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v55.Prefetch(12)

