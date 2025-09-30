import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v160 = LSMASHVideoSource(dst_dir + "v160rc.mp4")

v160 = v160.Filter(th_SAD=400, th_SADC=400, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v160 = v160.convertToYV12(interlaced=false)

v160 = v160.UnsharpMask(strength=500, radius=5, threshold=1)
v160 = v160.adjustBorders

va = BlankClip(v160, audio_rate = 48000, channels = 2).killVideo
v160 = v160.audioDub(va)

return v160.Prefetch

