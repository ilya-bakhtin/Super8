import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v319 = LSMASHVideoSource(dst_dir + "v319rc.mp4")

v319 = v319.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v319 = v319.convertToYV12(interlaced=false)

v319 = v319.UnsharpMask(strength=500, radius=5, threshold=1)
v319 = v319.adjustBorders

va = BlankClip(v319, audio_rate = 48000, channels = 2).killVideo
v319 = v319.audioDub(va)

return v319.Prefetch

