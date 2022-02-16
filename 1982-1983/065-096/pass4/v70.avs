LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v70 = LWLibavVideoSource(source_dir + "v70rc.avi", cache=false)
v70 = v70.convertToYV24(interlaced=false)

v70 = v70.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v70 = v70.removeDirt
v70 = v70.convertToYV12
v70 = v70.UnsharpMask(strength=300, radius=5, threshold=1)
v70 = v70.adjustBorders
v70 = v70.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v70.Prefetch(12)

