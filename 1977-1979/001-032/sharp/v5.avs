import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v5 = LSMASHVideoSource(dst_dir + "v5rc.mp4")

v5 = v5.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v5 = v5.convertToYV12(interlaced=false)

v5 = v5.UnsharpMask(strength=500, radius=5, threshold=1)
v5 = v5.adjustBorders

va = BlankClip(v5, audio_rate = 48000, channels = 2).killVideo
v5 = v5.audioDub(va)

return v5.Prefetch

