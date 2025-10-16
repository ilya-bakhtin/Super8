import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v206 = LSMASHVideoSource(dst_dir + "v206rc.mp4")

v206 = v206.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v206 = v206.convertToYV12(interlaced=false)

v206 = v206.UnsharpMask(strength=500, radius=5, threshold=1)
v206 = v206.adjustBorders

va = BlankClip(v206, audio_rate = 48000, channels = 2).killVideo
v206 = v206.audioDub(va)

return v206.Prefetch

