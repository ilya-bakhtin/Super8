LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v12 = LWLibavVideoSource(source_dir + "v12rc.avi", cache=false)
v12 = v12.convertToYV24(interlaced=false)

v12 = v12.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v12 = v12.removeDirt
v12 = v12.convertToYV12
v12 = v12.UnsharpMask(strength=300, radius=5, threshold=1)
v12 = v12.adjustBorders
v12 = v12.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v12.Prefetch(12)

