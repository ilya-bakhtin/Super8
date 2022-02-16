LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v122 = LWLibavVideoSource(source_dir + "v122rc.avi", cache=false)
v122 = v122.convertToYV24(interlaced=false)

v122 = v122.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v122 = v122.removeDirt
v122 = v122.convertToYV12
v122 = v122.UnsharpMask(strength=300, radius=5, threshold=1)
v122 = v122.adjustBorders
v122 = v122.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v122.Prefetch(12)

