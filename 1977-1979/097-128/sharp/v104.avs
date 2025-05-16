import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v104 = LSMASHVideoSource(dst_dir + "v104rc.mp4")

v104 = v104.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v104 = v104.convertToYV12(interlaced=false)

v104 = v104.UnsharpMask(strength=500, radius=5, threshold=1)
v104 = v104.adjustBorders

va = BlankClip(v104, audio_rate = 48000, channels = 2).killVideo
v104 = v104.audioDub(va)

return v104.Prefetch

