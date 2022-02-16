LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v192 = LWLibavVideoSource(source_dir + "v192rc.avi", cache=false)
v192 = v192.convertToYV24(interlaced=false)

v192 = v192.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v192 = v192.removeDirt
v192 = v192.convertToYV12
v192 = v192.UnsharpMask(strength=300, radius=5, threshold=1)
v192 = v192.adjustBorders
v192 = v192.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v192.Prefetch(12)

