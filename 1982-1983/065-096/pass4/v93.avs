LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v93 = LWLibavVideoSource(source_dir + "v93rc.avi", cache=false)
v93 = v93.convertToYV24(interlaced=false)

v93 = v93.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v93 = v93.removeDirt
v93 = v93.convertToYV12
v93 = v93.UnsharpMask(strength=300, radius=5, threshold=1)
v93 = v93.adjustBorders
v93 = v93.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v93.Prefetch(12)

