LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v154 = LWLibavVideoSource(source_dir + "v154rc.avi", cache=false)
v154 = v154.convertToYV24(interlaced=false)

v154 = v154.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v154 = v154.removeDirt
v154 = v154.convertToYV12
v154 = v154.UnsharpMask(strength=300, radius=5, threshold=1)
v154 = v154.adjustBorders
v154 = v154.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v154.Prefetch(12)

