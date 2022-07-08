LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v6 = LWLibavVideoSource(source_dir + "v6rc.avi", cache=false)
v6 = v6.convertToYV24(interlaced=false)

v6 = v6.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v6 = v6.removeDirt
v6 = v6.convertToYV12
v6 = v6.UnsharpMask(strength=400, radius=7, threshold=1)
v6 = v6.adjustBorders
#v6 = v6.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v6.Prefetch(12)

