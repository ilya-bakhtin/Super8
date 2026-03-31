import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v305 = LSMASHVideoSource(dst_dir + "v305rc.mp4")

v305 = v305.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v305 = v305.convertToYV12(interlaced=false)

v305 = v305.UnsharpMask(strength=500, radius=5, threshold=1)
v305 = v305.adjustBorders

va = BlankClip(v305, audio_rate = 48000, channels = 2).killVideo
v305 = v305.audioDub(va)

return v305.Prefetch

