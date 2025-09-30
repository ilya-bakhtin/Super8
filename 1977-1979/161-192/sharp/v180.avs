import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v180 = LSMASHVideoSource(dst_dir + "v180rc.mp4")

v180 = v180.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v180 = v180.convertToYV12(interlaced=false)

v180 = v180.UnsharpMask(strength=500, radius=5, threshold=1)
v180 = v180.adjustBorders

va = BlankClip(v180, audio_rate = 48000, channels = 2).killVideo
v180 = v180.audioDub(va)

return v180.Prefetch

