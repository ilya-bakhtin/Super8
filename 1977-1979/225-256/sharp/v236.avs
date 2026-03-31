import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v236 = LSMASHVideoSource(dst_dir + "v236rc.mp4")

v236 = v236.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v236 = v236.convertToYV12(interlaced=false)

v236 = v236.UnsharpMask(strength=500, radius=5, threshold=1)
v236 = v236.adjustBorders

va = BlankClip(v236, audio_rate = 48000, channels = 2).killVideo
v236 = v236.audioDub(va)

return v236.Prefetch

