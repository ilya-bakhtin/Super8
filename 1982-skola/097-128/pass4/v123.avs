LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v123 = LWLibavVideoSource(source_dir + "v123rc.avi", cache=false)
v123 = v123.convertToYV24(interlaced=false)

v123 = v123.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v123 = v123.removeDirt
v123 = v123.convertToYV12
v123 = v123.UnsharpMask(strength=400, radius=7, threshold=1)
v123 = v123.adjustBorders
#v123 = v123.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v123 = v123.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v123.Prefetch(12)

