LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v179 = LWLibavVideoSource(source_dir + "v179rc.avi", cache=false)
v179 = v179.convertToYV24(interlaced=false)

v179 = v179.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v179 = v179.removeDirt
v179 = v179.convertToYV12
v179 = v179.UnsharpMask(strength=300, radius=5, threshold=1)
v179 = v179.adjustBorders
v179 = v179.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v179.Prefetch(12)

