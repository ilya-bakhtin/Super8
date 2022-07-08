LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v55 = LWLibavVideoSource(source_dir + "v55rc.avi", cache=false)
v55 = v55.convertToYV24(interlaced=false)

v55 = v55.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v55 = v55.removeDirt
v55 = v55.convertToYV12
v55 = v55.UnsharpMask(strength=400, radius=7, threshold=1)
v55 = v55.adjustBorders
#v55 = v55.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v55 = v55.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v55.Prefetch(12)

