LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v25 = LWLibavVideoSource(source_dir + "v25rc.avi", cache=false)
v25 = v25.convertToYV24(interlaced=false)

v25 = v25.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v25 = v25.removeDirt
v25 = v25.convertToYV12
v25 = v25.UnsharpMask(strength=400, radius=7, threshold=1)
v25 = v25.adjustBorders
#v25 = v25.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v25 = v25.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v25.Prefetch(12)

