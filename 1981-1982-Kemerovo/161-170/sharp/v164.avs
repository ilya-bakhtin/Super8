import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v164 = LSMASHVideoSource(dst_dir + "v164rc.mp4")

v164 = v164.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v164 = v164.convertToYV12(interlaced=false)

v164 = v164.UnsharpMask(strength=500, radius=5, threshold=1)
v164 = v164.adjustBorders

va = BlankClip(v164, audio_rate = 48000, channels = 2).killVideo
v164 = v164.audioDub(va)

return v164.Prefetch

