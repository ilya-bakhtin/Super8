import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v269 = LSMASHVideoSource(dst_dir + "v269rc.mp4")

v269 = v269.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v269 = v269.convertToYV12(interlaced=false)

v269 = v269.UnsharpMask(strength=500, radius=5, threshold=1)
v269 = v269.adjustBorders

va = BlankClip(v269, audio_rate = 48000, channels = 2).killVideo
v269 = v269.audioDub(va)

return v269.Prefetch

