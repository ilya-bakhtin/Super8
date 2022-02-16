LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v4 = LWLibavVideoSource(source_dir + "v4rc.avi", cache=false)
v4 = v4.convertToYV24(interlaced=false)

v4 = v4.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v4 = v4.removeDirt
v4 = v4.convertToYV12
v4 = v4.UnsharpMask(strength=300, radius=5, threshold=1)
v4 = v4.adjustBorders
v4 = v4.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v4.Prefetch(12)

