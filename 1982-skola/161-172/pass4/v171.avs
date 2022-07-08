LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v171 = LWLibavVideoSource(source_dir + "v171rc.avi", cache=false)
v171 = v171.convertToYV24(interlaced=false)

v171 = v171.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v171 = v171.removeDirt
v171 = v171.convertToYV12
v171 = v171.UnsharpMask(strength=400, radius=7, threshold=1)
v171 = v171.adjustBorders
#v171 = v171.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v171 = v171.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v171.Prefetch(12)

