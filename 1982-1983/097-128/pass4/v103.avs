LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v103 = LWLibavVideoSource(source_dir + "v103rc.avi", cache=false)
v103 = v103.convertToYV24(interlaced=false)

v103 = v103.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v103 = v103.removeDirt
v103 = v103.convertToYV12
v103 = v103.UnsharpMask(strength=300, radius=5, threshold=1)
v103 = v103.adjustBorders
v103 = v103.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v103.Prefetch(12)

