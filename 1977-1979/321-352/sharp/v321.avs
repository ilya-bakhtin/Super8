import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v321 = LSMASHVideoSource(dst_dir + "v321rc.mp4")

v321 = v321.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v321 = v321.convertToYV12(interlaced=false)

v321 = v321.UnsharpMask(strength=500, radius=5, threshold=1)
v321 = v321.adjustBorders

va = BlankClip(v321, audio_rate = 48000, channels = 2).killVideo
v321 = v321.audioDub(va)

return v321.Prefetch

