import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v335 = LSMASHVideoSource(dst_dir + "v335rc.mp4")

v335 = v335.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v335 = v335.convertToYV12(interlaced=false)

v335 = v335.UnsharpMask(strength=500, radius=5, threshold=1)
v335 = v335.adjustBorders

va = BlankClip(v335, audio_rate = 48000, channels = 2).killVideo
v335 = v335.audioDub(va)

return v335.Prefetch

