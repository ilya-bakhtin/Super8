LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v76 = LWLibavVideoSource(source_dir + "v76rc.avi", cache=false)
v76 = v76.convertToYV24(interlaced=false)

v76 = v76.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v76 = v76.removeDirt
v76 = v76.convertToYV12
v76 = v76.UnsharpMask(strength=400, radius=7, threshold=1)
v76 = v76.adjustBorders
#v76 = v76.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v76 = v76.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v76.Prefetch(12)

