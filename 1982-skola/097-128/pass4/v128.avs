LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v128 = LWLibavVideoSource(source_dir + "v128rc.avi", cache=false)
v128 = v128.convertToYV24(interlaced=false)

v128 = v128.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v128 = v128.removeDirt
v128 = v128.convertToYV12
v128 = v128.UnsharpMask(strength=400, radius=7, threshold=1)
v128 = v128.adjustBorders
#v128 = v128.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v128 = v128.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v128.Prefetch(12)

