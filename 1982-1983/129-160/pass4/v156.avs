LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v156 = LWLibavVideoSource(source_dir + "v156rc.avi", cache=false)
v156 = v156.convertToYV24(interlaced=false)

v156 = v156.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v156 = v156.removeDirt
v156 = v156.convertToYV12
v156 = v156.UnsharpMask(strength=300, radius=5, threshold=1)
v156 = v156.adjustBorders
v156 = v156.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v156.Prefetch(12)

