LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v32 = LWLibavVideoSource(source_dir + "v32rc.avi", cache=false)
v32 = v32.convertToYV24(interlaced=false)

v32 = v32.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v32 = v32.removeDirt
v32 = v32.convertToYV12
v32 = v32.UnsharpMask(strength=400, radius=7, threshold=1)
v32 = v32.adjustBorders
#v32 = v32.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v32 = v32.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v32.Prefetch(12)

