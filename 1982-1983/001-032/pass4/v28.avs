LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v28 = LWLibavVideoSource(source_dir + "v28rc.avi", cache=false)
v28 = v28.convertToYV24(interlaced=false)

v28 = v28.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v28 = v28.removeDirt
v28 = v28.convertToYV12
v28 = v28.UnsharpMask(strength=300, radius=5, threshold=1)
v28 = v28.adjustBorders
v28 = v28.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v28.Prefetch(12)

