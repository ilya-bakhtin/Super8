import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v175 = LSMASHVideoSource(dst_dir + "v175rc.mp4")

v175 = v175.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v175 = v175.convertToYV12(interlaced=false)

v175 = v175.UnsharpMask(strength=500, radius=5, threshold=1)
v175 = v175.adjustBorders

va = BlankClip(v175, audio_rate = 48000, channels = 2).killVideo
v175 = v175.audioDub(va)

return v175.Prefetch

