LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v80 = LWLibavVideoSource(source_dir + "v80rc.avi", cache=false)
v80 = v80.convertToYV24(interlaced=false)

v80 = v80.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v80 = v80.removeDirt
v80 = v80.convertToYV12
v80 = v80.UnsharpMask(strength=300, radius=5, threshold=1)
v80 = v80.adjustBorders
v80 = v80.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v80.Prefetch(12)

