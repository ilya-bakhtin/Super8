LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v67 = LWLibavVideoSource(source_dir + "v67rc.avi", cache=false)
v67 = v67.convertToYV24(interlaced=false)

v67 = v67.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v67 = v67.removeDirt
v67 = v67.convertToYV12
v67 = v67.UnsharpMask(strength=400, radius=7, threshold=1)
v67 = v67.adjustBorders
#v67 = v67.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v67 = v67.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v67.Prefetch(12)

