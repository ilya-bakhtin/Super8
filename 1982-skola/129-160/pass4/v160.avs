LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v160 = LWLibavVideoSource(source_dir + "v160rc.avi", cache=false)
v160 = v160.convertToYV24(interlaced=false)

v160 = v160.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v160 = v160.removeDirt
v160 = v160.convertToYV12
v160 = v160.UnsharpMask(strength=400, radius=7, threshold=1)
v160 = v160.adjustBorders
#v160 = v160.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v160 = v160.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v160.Prefetch(12)

