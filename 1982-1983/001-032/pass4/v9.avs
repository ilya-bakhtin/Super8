LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v9 = LWLibavVideoSource(source_dir + "v9rc.avi", cache=false)
v9 = v9.convertToYV24(interlaced=false)

v9 = v9.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v9 = v9.removeDirt
v9 = v9.convertToYV12
v9 = v9.UnsharpMask(strength=300, radius=5, threshold=1)
v9 = v9.adjustBorders
v9 = v9.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v9.Prefetch(12)

