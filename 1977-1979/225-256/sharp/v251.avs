import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v251 = LSMASHVideoSource(dst_dir + "v251rc.mp4")

v251 = v251.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v251 = v251.convertToYV12(interlaced=false)

v251 = v251.UnsharpMask(strength=500, radius=5, threshold=1)
v251 = v251.adjustBorders

va = BlankClip(v251, audio_rate = 48000, channels = 2).killVideo
v251 = v251.audioDub(va)

return v251.Prefetch

