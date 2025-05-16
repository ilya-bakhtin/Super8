import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v41 = LSMASHVideoSource(dst_dir + "v41rc.mp4")

v41 = v41.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v41 = v41.convertToYV12(interlaced=false)

v41 = v41.UnsharpMask(strength=500, radius=5, threshold=1)
v41 = v41.adjustBorders

va = BlankClip(v41, audio_rate = 48000, channels = 2).killVideo
v41 = v41.audioDub(va)

return v41.Prefetch

