import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v348 = LSMASHVideoSource(dst_dir + "v348rc.mp4")

v348 = v348.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v348 = v348.convertToYV12(interlaced=false)

v348 = v348.UnsharpMask(strength=500, radius=5, threshold=1)
v348 = v348.adjustBorders

va = BlankClip(v348, audio_rate = 48000, channels = 2).killVideo
v348 = v348.audioDub(va)

return v348.Prefetch

