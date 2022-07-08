LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v104 = LWLibavVideoSource(source_dir + "v104rc.avi", cache=false)
v104 = v104.convertToYV24(interlaced=false)

v104 = v104.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v104 = v104.removeDirt
v104 = v104.convertToYV12
v104 = v104.UnsharpMask(strength=400, radius=7, threshold=1)
v104 = v104.adjustBorders
#v104 = v104.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v104 = v104.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v104.Prefetch(12)

