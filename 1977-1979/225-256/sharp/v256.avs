import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v256 = LSMASHVideoSource(dst_dir + "v256rc.mp4")

v256 = v256.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v256 = v256.convertToYV12(interlaced=false)

v256 = v256.UnsharpMask(strength=500, radius=5, threshold=1)
v256 = v256.adjustBorders

va = BlankClip(v256, audio_rate = 48000, channels = 2).killVideo
v256 = v256.audioDub(va)

return v256.Prefetch

