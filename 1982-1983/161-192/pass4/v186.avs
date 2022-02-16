LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v186 = LWLibavVideoSource(source_dir + "v186rc.avi", cache=false)
v186 = v186.convertToYV24(interlaced=false)

v186 = v186.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v186 = v186.removeDirt
v186 = v186.convertToYV12
v186 = v186.UnsharpMask(strength=300, radius=5, threshold=1)
v186 = v186.adjustBorders
v186 = v186.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v186.Prefetch(12)

