import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v384 = LSMASHVideoSource(dst_dir + "v384rc.mp4")

v384 = v384.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v384 = v384.convertToYV12(interlaced=false)

v384 = v384.UnsharpMask(strength=500, radius=5, threshold=1)
v384 = v384.adjustBorders

va = BlankClip(v384, audio_rate = 48000, channels = 2).killVideo
v384 = v384.audioDub(va)

return v384.Prefetch

