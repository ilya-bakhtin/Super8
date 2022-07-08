LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v23 = LWLibavVideoSource(source_dir + "v23rc.avi", cache=false)
v23 = v23.convertToYV24(interlaced=false)

v23 = v23.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v23 = v23.removeDirt
v23 = v23.convertToYV12
v23 = v23.UnsharpMask(strength=400, radius=7, threshold=1)
v23 = v23.adjustBorders
#v23 = v23.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = v23.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v23.Prefetch(12)

