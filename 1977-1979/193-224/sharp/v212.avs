import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v212 = LSMASHVideoSource(dst_dir + "v212rc.mp4")

v212 = v212.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v212 = v212.convertToYV12(interlaced=false)

v212 = v212.UnsharpMask(strength=500, radius=5, threshold=1)
v212 = v212.adjustBorders

va = BlankClip(v212, audio_rate = 48000, channels = 2).killVideo
v212 = v212.audioDub(va)

return v212.Prefetch

