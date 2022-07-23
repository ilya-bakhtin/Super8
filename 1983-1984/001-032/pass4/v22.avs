LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v22 = LWLibavVideoSource(source_dir + "v22rc.avi", cache=false)
v22 = v22.convertToYV24(interlaced=false)

v22 = v22.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v22 = v22.removeDirt
v22 = v22.convertToYV12
v22 = v22.UnsharpMask(strength=400, radius=7, threshold=1)
v22 = v22.adjustBorders
#v22 = v22.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v22.Prefetch(12)

