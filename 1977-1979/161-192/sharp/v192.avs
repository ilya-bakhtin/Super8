import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v192 = LSMASHVideoSource(dst_dir + "v192rc.mp4")

v192 = v192.Filter(th_SAD=400, th_SADC=400, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v192 = v192.convertToYV12(interlaced=false)

v192 = v192.UnsharpMask(strength=500, radius=5, threshold=1)
v192 = v192.adjustBorders

va = BlankClip(v192, audio_rate = 48000, channels = 2).killVideo
v192 = v192.audioDub(va)

return v192.Prefetch

