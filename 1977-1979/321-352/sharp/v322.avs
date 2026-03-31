import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v322 = LSMASHVideoSource(dst_dir + "v322rc.mp4")

v322 = v322.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v322 = v322.convertToYV12(interlaced=false)

v322 = v322.UnsharpMask(strength=500, radius=5, threshold=1)
v322 = v322.adjustBorders

va = BlankClip(v322, audio_rate = 48000, channels = 2).killVideo
v322 = v322.audioDub(va)

return v322.Prefetch

