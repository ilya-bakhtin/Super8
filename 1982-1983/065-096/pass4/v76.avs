LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v76 = LWLibavVideoSource(source_dir + "v76rc.avi", cache=false)
v76 = v76.convertToYV24(interlaced=false)

v76 = v76.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v76 = v76.removeDirt
v76 = v76.convertToYV12
v76 = v76.UnsharpMask(strength=300, radius=5, threshold=1)
v76 = v76.adjustBorders
v76 = v76.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v76.Prefetch(12)

