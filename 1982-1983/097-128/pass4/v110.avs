LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v110 = LWLibavVideoSource(source_dir + "v110rc.avi", cache=false)
v110 = v110.convertToYV24(interlaced=false)

v110 = v110.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v110 = v110.removeDirt
v110 = v110.convertToYV12
v110 = v110.UnsharpMask(strength=300, radius=5, threshold=1)
v110 = v110.adjustBorders
v110 = v110.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v110.Prefetch(12)

