LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v148 = LWLibavVideoSource(source_dir + "v148rc.avi", cache=false)
v148 = v148.convertToYV24(interlaced=false)

v148 = v148.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v148 = v148.removeDirt
v148 = v148.convertToYV12
v148 = v148.UnsharpMask(strength=300, radius=5, threshold=1)
v148 = v148.adjustBorders
v148 = v148.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v148.Prefetch(12)

