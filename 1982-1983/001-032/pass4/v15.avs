LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v15 = LWLibavVideoSource(source_dir + "v15rc.avi", cache=false)
v15 = v15.convertToYV24(interlaced=false)

v15 = v15.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v15 = v15.removeDirt
v15 = v15.convertToYV12
v15 = v15.UnsharpMask(strength=300, radius=5, threshold=1)
v15 = v15.adjustBorders
v15 = v15.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v15.Prefetch(12)

