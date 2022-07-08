LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v151 = LWLibavVideoSource(source_dir + "v151rc.avi", cache=false)
v151 = v151.convertToYV24(interlaced=false)

v151 = v151.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v151 = v151.removeDirt
v151 = v151.convertToYV12
v151 = v151.UnsharpMask(strength=400, radius=7, threshold=1)
v151 = v151.adjustBorders
#v151 = v151.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v151 = v151.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v151.Prefetch(12)

