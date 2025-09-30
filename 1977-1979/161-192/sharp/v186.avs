import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v186 = LSMASHVideoSource(dst_dir + "v186rc.mp4")

v186 = v186.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v186 = v186.convertToYV12(interlaced=false)

v186 = v186.UnsharpMask(strength=500, radius=5, threshold=1)
v186 = v186.adjustBorders

va = BlankClip(v186, audio_rate = 48000, channels = 2).killVideo
v186 = v186.audioDub(va)

return v186.Prefetch

