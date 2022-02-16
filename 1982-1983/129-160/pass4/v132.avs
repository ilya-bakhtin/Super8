LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v132 = LWLibavVideoSource(source_dir + "v132rc.avi", cache=false)
v132 = v132.convertToYV24(interlaced=false)

v132 = v132.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v132 = v132.removeDirt
v132 = v132.convertToYV12
v132 = v132.UnsharpMask(strength=300, radius=5, threshold=1)
v132 = v132.adjustBorders
v132 = v132.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v132.Prefetch(12)

