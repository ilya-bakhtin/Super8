LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v34 = LWLibavVideoSource(source_dir + "v34rc.avi", cache=false)
v34 = v34.convertToYV24(interlaced=false)

v34 = v34.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v34 = v34.removeDirt
v34 = v34.convertToYV12
v34 = v34.UnsharpMask(strength=400, radius=7, threshold=1)
v34 = v34.adjustBorders
#v34 = v34.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v34 = v34.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v34.Prefetch(12)

