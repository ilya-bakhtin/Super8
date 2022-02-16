LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v140 = LWLibavVideoSource(source_dir + "v140rc.avi", cache=false)
v140 = v140.convertToYV24(interlaced=false)

v140 = v140.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v140 = v140.removeDirt
v140 = v140.convertToYV12
v140 = v140.UnsharpMask(strength=300, radius=5, threshold=1)
v140 = v140.adjustBorders
v140 = v140.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v140.Prefetch(12)

