import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v255 = LSMASHVideoSource(dst_dir + "v255rc.mp4")

v255 = v255.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v255 = v255.convertToYV12(interlaced=false)

v255 = v255.UnsharpMask(strength=500, radius=5, threshold=1)
v255 = v255.adjustBorders

va = BlankClip(v255, audio_rate = 48000, channels = 2).killVideo
v255 = v255.audioDub(va)

return v255.Prefetch

