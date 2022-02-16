LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v185 = LWLibavVideoSource(source_dir + "v185rc.avi", cache=false)
v185 = v185.convertToYV24(interlaced=false)

v185 = v185.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v185 = v185.removeDirt
v185 = v185.convertToYV12
v185 = v185.UnsharpMask(strength=300, radius=5, threshold=1)
v185 = v185.adjustBorders
v185 = v185.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v185.Prefetch(12)

