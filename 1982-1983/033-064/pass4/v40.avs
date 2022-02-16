LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v40 = LWLibavVideoSource(source_dir + "v40rc.avi", cache=false)
v40 = v40.convertToYV24(interlaced=false)

v40 = v40.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v40 = v40.removeDirt
v40 = v40.convertToYV12
v40 = v40.UnsharpMask(strength=300, radius=5, threshold=1)
v40 = v40.adjustBorders
v40 = v40.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v40.Prefetch(12)

