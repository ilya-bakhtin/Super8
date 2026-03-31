import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v276 = LSMASHVideoSource(dst_dir + "v276rc.mp4")

v276 = v276.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v276 = v276.convertToYV12(interlaced=false)

v276 = v276.UnsharpMask(strength=500, radius=5, threshold=1)
v276 = v276.adjustBorders

va = BlankClip(v276, audio_rate = 48000, channels = 2).killVideo
v276 = v276.audioDub(va)

return v276.Prefetch

