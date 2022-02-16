LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v142 = LWLibavVideoSource(source_dir + "v142rc.avi", cache=false)
v142 = v142.convertToYV24(interlaced=false)

v142 = v142.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v142 = v142.removeDirt
v142 = v142.convertToYV12
v142 = v142.UnsharpMask(strength=300, radius=5, threshold=1)
v142 = v142.adjustBorders
v142 = v142.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v142.Prefetch(12)

