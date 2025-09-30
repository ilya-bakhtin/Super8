import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v183 = LSMASHVideoSource(dst_dir + "v183rc.mp4")

v183 = v183.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v183 = v183.convertToYV12(interlaced=false)

v183 = v183.UnsharpMask(strength=500, radius=5, threshold=1)
v183 = v183.adjustBorders

va = BlankClip(v183, audio_rate = 48000, channels = 2).killVideo
v183 = v183.audioDub(va)

return v183.Prefetch

