LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v14 = LWLibavVideoSource(source_dir + "v14rc.avi", cache=false)
v14 = v14.convertToYV24(interlaced=false)

v14 = v14.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v14 = v14.removeDirt
v14 = v14.convertToYV12
v14 = v14.UnsharpMask(strength=400, radius=7, threshold=1)
v14 = v14.adjustBorders
#v14 = v14.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v14.Prefetch(12)

