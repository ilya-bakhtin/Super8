import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v128 = LSMASHVideoSource(dst_dir + "v128rc.mp4")

v128 = v128.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v128 = v128.convertToYV12(interlaced=false)

v128 = v128.UnsharpMask(strength=500, radius=5, threshold=1)
v128 = v128.adjustBorders

va = BlankClip(v128, audio_rate = 48000, channels = 2).killVideo
v128 = v128.audioDub(va)

return v128.Prefetch

