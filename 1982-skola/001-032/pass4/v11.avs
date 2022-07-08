LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v11 = LWLibavVideoSource(source_dir + "v11rc.avi", cache=false)
v11 = v11.convertToYV24(interlaced=false)

v11 = v11.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v11 = v11.removeDirt
v11 = v11.convertToYV12
v11 = v11.UnsharpMask(strength=400, radius=7, threshold=1)
v11 = v11.adjustBorders
#v11 = v11.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v11.Prefetch(12)

