import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v129 = LSMASHVideoSource(dst_dir + "v129rc.mp4")

v129 = v129.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v129 = v129.convertToYV12(interlaced=false)

v129 = v129.UnsharpMask(strength=500, radius=5, threshold=1)
v129 = v129.adjustBorders

va = BlankClip(v129, audio_rate = 48000, channels = 2).killVideo
v129 = v129.audioDub(va)

return v129.Prefetch

