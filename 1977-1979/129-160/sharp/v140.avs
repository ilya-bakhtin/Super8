import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v140 = LSMASHVideoSource(dst_dir + "v140rc.mp4")

v140 = v140.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v140 = v140.convertToYV12(interlaced=false)

v140 = v140.UnsharpMask(strength=500, radius=5, threshold=1)
v140 = v140.adjustBorders

va = BlankClip(v140, audio_rate = 48000, channels = 2).killVideo
v140 = v140.audioDub(va)

return v140.Prefetch

