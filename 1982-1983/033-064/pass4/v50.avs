LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v50 = LWLibavVideoSource(source_dir + "v50rc.avi", cache=false)
v50 = v50.convertToYV24(interlaced=false)

v50 = v50.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v50 = v50.removeDirt
v50 = v50.convertToYV12
v50 = v50.UnsharpMask(strength=300, radius=5, threshold=1)
v50 = v50.adjustBorders
v50 = v50.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v50.Prefetch(12)

