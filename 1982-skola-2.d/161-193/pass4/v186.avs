LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v186 = LSMASHVideoSource(dst_dir + "v186rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v186f.mp4")
v186 = ImageSource(file = dst_dir + "v186-png\v186-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v186 = v186.convertToY.adjustSize

#v186 = v186.extractY.convertToYV12(interlaced=false)
#v186 = v186.deScratch.extractY

v186 = v186.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v186 = v186.convertBits(8).convertToYV12(interlaced=false)

v186 = v186.deScratch.extractY
v186 = v186.removeDirt
v186 = v186.convertToYV12(interlaced=false)
v186 = v186.UnsharpMask(strength=400, radius=5, threshold=1)
v186 = v186.adjustBorders
#v186 = v186.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v186 = v186.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v186, audio_rate = 48000, channels = 2).killVideo
v186 = v186.audioDub(va)

return v186.Prefetch

