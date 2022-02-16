LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v137 = LWLibavVideoSource(source_dir + "v137rc.avi", cache=false)
v137 = v137.convertToYV24(interlaced=false)

v137 = v137.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v137 = v137.removeDirt
v137 = v137.convertToYV12
v137 = v137.UnsharpMask(strength=300, radius=5, threshold=1)
v137 = v137.adjustBorders
v137 = v137.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v137.Prefetch(12)

