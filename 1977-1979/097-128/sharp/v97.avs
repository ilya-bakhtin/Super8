import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v97 = LSMASHVideoSource(dst_dir + "v97rc.mp4")

v97 = v97.Filter(th_SAD=400, th_SADC=400, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v97 = v97.convertToYV12(interlaced=false)

v97 = v97.UnsharpMask(strength=500, radius=5, threshold=1)
v97 = v97.adjustBorders

va = BlankClip(v97, audio_rate = 48000, channels = 2).killVideo
v97 = v97.audioDub(va)

return v97.Prefetch

