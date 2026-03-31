import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v343 = LSMASHVideoSource(dst_dir + "v343rc.mp4")

v343 = v343.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v343 = v343.convertToYV12(interlaced=false)

v343 = v343.UnsharpMask(strength=500, radius=5, threshold=1)
v343 = v343.adjustBorders

va = BlankClip(v343, audio_rate = 48000, channels = 2).killVideo
v343 = v343.audioDub(va)

return v343.Prefetch

