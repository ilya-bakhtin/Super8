import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v361 = LSMASHVideoSource(dst_dir + "v361rc.mp4")

v361 = v361.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v361 = v361.convertToYV12(interlaced=false)

v361 = v361.UnsharpMask(strength=500, radius=5, threshold=1)
v361 = v361.adjustBorders

va = BlankClip(v361, audio_rate = 48000, channels = 2).killVideo
v361 = v361.audioDub(va)

return v361.Prefetch

