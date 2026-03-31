import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v278 = LSMASHVideoSource(dst_dir + "v278rc.mp4")

v278 = v278.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v278 = v278.convertToYV12(interlaced=false)

v278 = v278.UnsharpMask(strength=500, radius=5, threshold=1)
v278 = v278.adjustBorders

va = BlankClip(v278, audio_rate = 48000, channels = 2).killVideo
v278 = v278.audioDub(va)

return v278.Prefetch

