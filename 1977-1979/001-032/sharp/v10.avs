import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v10 = LSMASHVideoSource(dst_dir + "v10rc.mp4")

v10 = v10.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v10 = v10.convertToYV12(interlaced=false)

v10 = v10.UnsharpMask(strength=500, radius=5, threshold=1)
v10 = v10.adjustBorders

va = BlankClip(v10, audio_rate = 48000, channels = 2).killVideo
v10 = v10.audioDub(va)

return v10.Prefetch

