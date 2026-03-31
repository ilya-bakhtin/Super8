import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v298 = LSMASHVideoSource(dst_dir + "v298rc.mp4")

v298 = v298.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v298 = v298.convertToYV12(interlaced=false)

v298 = v298.UnsharpMask(strength=500, radius=5, threshold=1)
v298 = v298.adjustBorders

va = BlankClip(v298, audio_rate = 48000, channels = 2).killVideo
v298 = v298.audioDub(va)

return v298.Prefetch

