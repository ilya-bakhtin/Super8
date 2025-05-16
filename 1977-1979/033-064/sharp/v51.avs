import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v51 = LSMASHVideoSource(dst_dir + "v51rc.mp4")

v51 = v51.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v51 = v51.convertToYV12(interlaced=false)

v51 = v51.UnsharpMask(strength=500, radius=5, threshold=1)
v51 = v51.adjustBorders

va = BlankClip(v51, audio_rate = 48000, channels = 2).killVideo
v51 = v51.audioDub(va)

return v51.Prefetch

