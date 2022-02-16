LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v123 = LWLibavVideoSource(source_dir + "v123rc.avi", cache=false)
v123 = v123.convertToYV24(interlaced=false)

v123 = v123.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v123 = v123.removeDirt
v123 = v123.convertToYV12
v123 = v123.UnsharpMask(strength=300, radius=5, threshold=1)
v123 = v123.adjustBorders
v123 = v123.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v123.Prefetch(12)

