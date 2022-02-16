LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v111 = LWLibavVideoSource(source_dir + "v111rc.avi", cache=false)
v111 = v111.convertToYV24(interlaced=false)

v111 = v111.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v111 = v111.removeDirt
v111 = v111.convertToYV12
v111 = v111.UnsharpMask(strength=300, radius=5, threshold=1)
v111 = v111.adjustBorders
v111 = v111.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v111.Prefetch(12)

