LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v18 = LWLibavVideoSource(source_dir + "v18rc.avi", cache=false)
v18 = v18.convertToYV24(interlaced=false)

v18 = v18.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v18 = v18.removeDirt
v18 = v18.convertToYV12
v18 = v18.UnsharpMask(strength=400, radius=7, threshold=1)
v18 = v18.adjustBorders
#v18 = v18.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v18.Prefetch(12)

