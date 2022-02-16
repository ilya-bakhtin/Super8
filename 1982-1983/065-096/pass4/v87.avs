LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v87 = LWLibavVideoSource(source_dir + "v87rc.avi", cache=false)
v87 = v87.convertToYV24(interlaced=false)

v87 = v87.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v87 = v87.removeDirt
v87 = v87.convertToYV12
v87 = v87.UnsharpMask(strength=300, radius=5, threshold=1)
v87 = v87.adjustBorders
v87 = v87.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v87.Prefetch(12)

