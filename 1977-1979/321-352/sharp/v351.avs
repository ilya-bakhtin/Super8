import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v351 = LSMASHVideoSource(dst_dir + "v351rc.mp4")

v351 = v351.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v351 = v351.convertToYV12(interlaced=false)

v351 = v351.UnsharpMask(strength=500, radius=5, threshold=1)
v351 = v351.adjustBorders

va = BlankClip(v351, audio_rate = 48000, channels = 2).killVideo
v351 = v351.audioDub(va)

return v351.Prefetch

