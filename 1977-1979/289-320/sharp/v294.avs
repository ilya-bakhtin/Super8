import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v294 = LSMASHVideoSource(dst_dir + "v294rc.mp4")

v294 = v294.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v294 = v294.convertToYV12(interlaced=false)

v294 = v294.UnsharpMask(strength=500, radius=5, threshold=1)
v294 = v294.adjustBorders

va = BlankClip(v294, audio_rate = 48000, channels = 2).killVideo
v294 = v294.audioDub(va)

return v294.Prefetch

