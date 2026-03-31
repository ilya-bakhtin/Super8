import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v272 = LSMASHVideoSource(dst_dir + "v272rc.mp4")

v272 = v272.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v272 = v272.convertToYV12(interlaced=false)

v272 = v272.UnsharpMask(strength=500, radius=5, threshold=1)
v272 = v272.adjustBorders

va = BlankClip(v272, audio_rate = 48000, channels = 2).killVideo
v272 = v272.audioDub(va)

return v272.Prefetch

