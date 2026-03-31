import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v340 = LSMASHVideoSource(dst_dir + "v340rc.mp4")

v340 = v340.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v340 = v340.convertToYV12(interlaced=false)

v340 = v340.UnsharpMask(strength=500, radius=5, threshold=1)
v340 = v340.adjustBorders

va = BlankClip(v340, audio_rate = 48000, channels = 2).killVideo
v340 = v340.audioDub(va)

return v340.Prefetch

