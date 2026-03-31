import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v333 = LSMASHVideoSource(dst_dir + "v333rc.mp4")

v333 = v333.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v333 = v333.convertToYV12(interlaced=false)

v333 = v333.UnsharpMask(strength=500, radius=5, threshold=1)
v333 = v333.adjustBorders

va = BlankClip(v333, audio_rate = 48000, channels = 2).killVideo
v333 = v333.audioDub(va)

return v333.Prefetch

