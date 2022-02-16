LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v6 = LWLibavVideoSource(source_dir + "v6rc.avi", cache=false)
v6 = v6.convertToYV24(interlaced=false)

v6 = v6.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v6 = v6.removeDirt
v6 = v6.convertToYV12
v6 = v6.UnsharpMask(strength=300, radius=5, threshold=1)
v6 = v6.adjustBorders
v6 = v6.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v6.Prefetch(12)

