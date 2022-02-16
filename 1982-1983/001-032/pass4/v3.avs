LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v3 = LWLibavVideoSource(source_dir + "v3rc.avi", cache=false)
v3 = v3.convertToYV24(interlaced=false)

v3 = v3.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v3 = v3.removeDirt
v3 = v3.convertToYV12
v3 = v3.UnsharpMask(strength=300, radius=5, threshold=1)
v3 = v3.adjustBorders
v3 = v3.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v3.Prefetch(12)

