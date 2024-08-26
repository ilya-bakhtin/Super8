import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
v26 = LSMASHVideoSource(dst_dir + "v26rc.mp4")

v26 = v26.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v26 = v26.convertToYV12(interlaced=false)

v26 = v26.UnsharpMask(strength=500, radius=5, threshold=1)
v26 = v26.adjustBorders

va = BlankClip(v26, audio_rate = 48000, channels = 2).killVideo
v26 = v26.audioDub(va)

return v26.Prefetch

