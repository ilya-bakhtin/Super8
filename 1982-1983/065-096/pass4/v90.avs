LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v90 = LWLibavVideoSource(source_dir + "v90rc.avi", cache=false)
v90 = v90.convertToYV24(interlaced=false)

v90 = v90.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v90 = v90.removeDirt
v90 = v90.convertToYV12
v90 = v90.UnsharpMask(strength=300, radius=5, threshold=1)
v90 = v90.adjustBorders
v90 = v90.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v90.Prefetch(12)

