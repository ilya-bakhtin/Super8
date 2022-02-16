LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v107 = LWLibavVideoSource(source_dir + "v107rc.avi", cache=false)
v107 = v107.convertToYV24(interlaced=false)

v107 = v107.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v107 = v107.removeDirt
v107 = v107.convertToYV12
v107 = v107.UnsharpMask(strength=300, radius=5, threshold=1)
v107 = v107.adjustBorders
v107 = v107.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v107.Prefetch(12)

