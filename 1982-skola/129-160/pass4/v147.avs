LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v147 = LWLibavVideoSource(source_dir + "v147rc.avi", cache=false)
v147 = v147.convertToYV24(interlaced=false)

v147 = v147.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v147 = v147.removeDirt
v147 = v147.convertToYV12
v147 = v147.UnsharpMask(strength=400, radius=7, threshold=1)
v147 = v147.adjustBorders
#v147 = v147.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v147 = v147.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v147.Prefetch(12)

