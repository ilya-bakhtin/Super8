LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v9 = LWLibavVideoSource(source_dir + "v9rc.avi", cache=false)
v9 = v9.convertToYV24(interlaced=false)

v9 = v9.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v9 = v9.removeDirt
v9 = v9.convertToYV12
v9 = v9.UnsharpMask(strength=400, radius=7, threshold=1)
v9 = v9.adjustBorders
#v9 = v9.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v9.Prefetch(12)

