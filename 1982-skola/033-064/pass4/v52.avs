LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v52 = LWLibavVideoSource(source_dir + "v52rc.avi", cache=false)
v52 = v52.convertToYV24(interlaced=false)

v52 = v52.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v52 = v52.removeDirt
v52 = v52.convertToYV12
v52 = v52.UnsharpMask(strength=400, radius=7, threshold=1)
v52 = v52.adjustBorders
#v52 = v52.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v52 = v52.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v52.Prefetch(12)

