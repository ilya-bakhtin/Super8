LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v136 = LWLibavVideoSource(source_dir + "v136rc.avi", cache=false)
v136 = v136.convertToYV24(interlaced=false)

v136 = v136.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v136 = v136.removeDirt
v136 = v136.convertToYV12
v136 = v136.UnsharpMask(strength=400, radius=7, threshold=1)
v136 = v136.adjustBorders
#v136 = v136.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v136 = v136.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v136.Prefetch(12)

