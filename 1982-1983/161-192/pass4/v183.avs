LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v183 = LWLibavVideoSource(source_dir + "v183rc.avi", cache=false)
v183 = v183.convertToYV24(interlaced=false)

v183 = v183.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v183 = v183.removeDirt
v183 = v183.convertToYV12
v183 = v183.UnsharpMask(strength=300, radius=5, threshold=1)
v183 = v183.adjustBorders
v183 = v183.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v183.Prefetch(12)

