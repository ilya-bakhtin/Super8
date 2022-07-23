LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v1 = LWLibavVideoSource(source_dir + "v1rc.avi", cache=false)
v1 = v1.convertToYV24(interlaced=false)

v1 = v1.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v1 = v1.removeDirt
v1 = v1.convertToYV12
v1 = v1.UnsharpMask(strength=400, radius=7, threshold=1)
v1 = v1.adjustBorders
#v1 = v1.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v1 = v1.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v1.Prefetch(12)

