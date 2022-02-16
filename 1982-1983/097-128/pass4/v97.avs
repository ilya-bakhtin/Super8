LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v97 = LWLibavVideoSource(source_dir + "v97rc.avi", cache=false)
v97 = v97.convertToYV24(interlaced=false)

v97 = v97.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v97 = v97.removeDirt
v97 = v97.convertToYV12
v97 = v97.UnsharpMask(strength=300, radius=5, threshold=1)
v97 = v97.adjustBorders
v97 = v97.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v97.Prefetch(12)

