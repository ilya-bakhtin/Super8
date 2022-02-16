LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v52 = LWLibavVideoSource(source_dir + "v52rc.avi", cache=false)
v52 = v52.convertToYV24(interlaced=false)

v52 = v52.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v52 = v52.removeDirt
v52 = v52.convertToYV12
v52 = v52.UnsharpMask(strength=300, radius=5, threshold=1)
v52 = v52.adjustBorders
v52 = v52.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v52.Prefetch(12)

