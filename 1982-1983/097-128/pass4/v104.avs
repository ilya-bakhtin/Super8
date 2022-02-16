LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v104 = LWLibavVideoSource(source_dir + "v104rc.avi", cache=false)
v104 = v104.convertToYV24(interlaced=false)

v104 = v104.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v104 = v104.removeDirt
v104 = v104.convertToYV12
v104 = v104.UnsharpMask(strength=300, radius=5, threshold=1)
v104 = v104.adjustBorders
v104 = v104.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v104.Prefetch(12)

