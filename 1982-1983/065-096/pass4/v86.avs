LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v86 = LWLibavVideoSource(source_dir + "v86rc.avi", cache=false)
v86 = v86.convertToYV24(interlaced=false)

v86 = v86.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v86 = v86.removeDirt
v86 = v86.convertToYV12
v86 = v86.UnsharpMask(strength=300, radius=5, threshold=1)
v86 = v86.adjustBorders
v86 = v86.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v86.Prefetch(12)

