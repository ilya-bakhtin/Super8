import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v310 = LSMASHVideoSource(dst_dir + "v310rc.mp4")

v310 = v310.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v310 = v310.convertToYV12(interlaced=false)

v310 = v310.UnsharpMask(strength=500, radius=5, threshold=1)
v310 = v310.adjustBorders

va = BlankClip(v310, audio_rate = 48000, channels = 2).killVideo
v310 = v310.audioDub(va)

return v310.Prefetch

