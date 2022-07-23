LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v27 = LWLibavVideoSource(source_dir + "v27rc.avi", cache=false)
v27 = v27.convertToYV24(interlaced=false)

v27 = v27.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v27 = v27.removeDirt
v27 = v27.convertToYV12
v27 = v27.UnsharpMask(strength=400, radius=7, threshold=1)
v27 = v27.adjustBorders
#v27 = v27.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v27 = v27.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v27.Prefetch(12)

