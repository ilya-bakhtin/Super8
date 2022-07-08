LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v30 = LWLibavVideoSource(source_dir + "v30rc.avi", cache=false)
v30 = v30.convertToYV24(interlaced=false)

v30 = v30.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v30 = v30.removeDirt
v30 = v30.convertToYV12
v30 = v30.UnsharpMask(strength=400, radius=7, threshold=1)
v30 = v30.adjustBorders
#v30 = v30.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v30 = v30.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v30.Prefetch(12)

