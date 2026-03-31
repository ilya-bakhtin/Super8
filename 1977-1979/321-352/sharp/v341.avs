import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v341 = LSMASHVideoSource(dst_dir + "v341rc.mp4")

v341 = v341.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v341 = v341.convertToYV12(interlaced=false)

v341 = v341.UnsharpMask(strength=500, radius=5, threshold=1)
v341 = v341.adjustBorders

va = BlankClip(v341, audio_rate = 48000, channels = 2).killVideo
v341 = v341.audioDub(va)

return v341.Prefetch

