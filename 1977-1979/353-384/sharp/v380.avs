import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v380 = LSMASHVideoSource(dst_dir + "v380rc.mp4")

v380 = v380.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v380 = v380.convertToYV12(interlaced=false)

v380 = v380.UnsharpMask(strength=500, radius=5, threshold=1)
v380 = v380.adjustBorders

va = BlankClip(v380, audio_rate = 48000, channels = 2).killVideo
v380 = v380.audioDub(va)

return v380.Prefetch

