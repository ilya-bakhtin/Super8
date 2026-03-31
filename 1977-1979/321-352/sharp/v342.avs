import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v342 = LSMASHVideoSource(dst_dir + "v342rc.mp4")

v342 = v342.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v342 = v342.convertToYV12(interlaced=false)

v342 = v342.UnsharpMask(strength=500, radius=5, threshold=1)
v342 = v342.adjustBorders

va = BlankClip(v342, audio_rate = 48000, channels = 2).killVideo
v342 = v342.audioDub(va)

return v342.Prefetch

