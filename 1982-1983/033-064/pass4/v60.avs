LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v60 = LWLibavVideoSource(source_dir + "v60rc.avi", cache=false)
v60 = v60.convertToYV24(interlaced=false)

v60 = v60.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v60 = v60.removeDirt
v60 = v60.convertToYV12
v60 = v60.UnsharpMask(strength=300, radius=5, threshold=1)
v60 = v60.adjustBorders
v60 = v60.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v60.Prefetch(12)

