LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v154 = LWLibavVideoSource(source_dir + "v154rc.avi", cache=false)
v154 = v154.convertToYV24(interlaced=false)

v154 = v154.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v154 = v154.removeDirt
v154 = v154.convertToYV12
v154 = v154.UnsharpMask(strength=400, radius=7, threshold=1)
v154 = v154.adjustBorders
#v154 = v154.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v154 = v154.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v154.Prefetch(12)

