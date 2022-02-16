LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v11 = LWLibavVideoSource(source_dir + "v11rc.avi", cache=false)
v11 = v11.convertToYV24(interlaced=false)

v11 = v11.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v11 = v11.removeDirt
v11 = v11.convertToYV12
v11 = v11.UnsharpMask(strength=300, radius=5, threshold=1)
v11 = v11.adjustBorders
v11 = v11.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v11.Prefetch(12)

