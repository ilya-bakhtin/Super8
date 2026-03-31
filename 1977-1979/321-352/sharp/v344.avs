import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v344 = LSMASHVideoSource(dst_dir + "v344rc.mp4")

v344 = v344.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v344 = v344.convertToYV12(interlaced=false)

v344 = v344.UnsharpMask(strength=500, radius=5, threshold=1)
v344 = v344.adjustBorders

va = BlankClip(v344, audio_rate = 48000, channels = 2).killVideo
v344 = v344.audioDub(va)

return v344.Prefetch

