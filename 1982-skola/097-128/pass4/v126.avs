LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v126 = LWLibavVideoSource(source_dir + "v126rc.avi", cache=false)
v126 = v126.convertToYV24(interlaced=false)

v126 = v126.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v126 = v126.removeDirt
v126 = v126.convertToYV12
v126 = v126.UnsharpMask(strength=400, radius=7, threshold=1)
v126 = v126.adjustBorders
#v126 = v126.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v126 = v126.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v126.Prefetch(12)

