LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v30 = LWLibavVideoSource(source_dir + "v30rc.avi", cache=false)
v30 = v30.convertToYV24(interlaced=false)

v30 = v30.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v30 = v30.removeDirt
v30 = v30.convertToYV12
v30 = v30.UnsharpMask(strength=300, radius=5, threshold=1)
v30 = v30.adjustBorders
v30 = v30.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v30.Prefetch(12)

