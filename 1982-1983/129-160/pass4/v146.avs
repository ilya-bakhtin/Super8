LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v146 = LWLibavVideoSource(source_dir + "v146rc.avi", cache=false)
v146 = v146.convertToYV24(interlaced=false)

v146 = v146.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v146 = v146.removeDirt
v146 = v146.convertToYV12
v146 = v146.UnsharpMask(strength=300, radius=5, threshold=1)
v146 = v146.adjustBorders
v146 = v146.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v146.Prefetch(12)

