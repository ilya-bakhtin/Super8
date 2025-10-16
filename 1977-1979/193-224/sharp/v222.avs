import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v222 = LSMASHVideoSource(dst_dir + "v222rc.mp4")

v222 = v222.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v222 = v222.convertToYV12(interlaced=false)

v222 = v222.UnsharpMask(strength=500, radius=5, threshold=1)
v222 = v222.adjustBorders

va = BlankClip(v222, audio_rate = 48000, channels = 2).killVideo
v222 = v222.audioDub(va)

return v222.Prefetch

