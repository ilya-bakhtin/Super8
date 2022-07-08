LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v148 = LWLibavVideoSource(source_dir + "v148rc.avi", cache=false)
v148 = v148.convertToYV24(interlaced=false)

v148 = v148.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v148 = v148.removeDirt
v148 = v148.convertToYV12
v148 = v148.UnsharpMask(strength=400, radius=7, threshold=1)
v148 = v148.adjustBorders
#v148 = v148.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v148 = v148.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v148.Prefetch(12)

