LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v116 = LWLibavVideoSource(source_dir + "v116rc.avi", cache=false)
v116 = v116.convertToYV24(interlaced=false)

v116 = v116.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v116 = v116.removeDirt
v116 = v116.convertToYV12
v116 = v116.UnsharpMask(strength=400, radius=7, threshold=1)
v116 = v116.adjustBorders
#v116 = v116.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v116 = v116.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v116.Prefetch(12)

