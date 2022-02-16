LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v89 = LWLibavVideoSource(source_dir + "v89rc.avi", cache=false)
v89 = v89.convertToYV24(interlaced=false)

v89 = v89.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v89 = v89.removeDirt
v89 = v89.convertToYV12
v89 = v89.UnsharpMask(strength=300, radius=5, threshold=1)
v89 = v89.adjustBorders
v89 = v89.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v89.Prefetch(12)

