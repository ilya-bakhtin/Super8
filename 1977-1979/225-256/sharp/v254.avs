import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v254 = LSMASHVideoSource(dst_dir + "v254rc.mp4")

v254 = v254.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v254 = v254.convertToYV12(interlaced=false)

v254 = v254.UnsharpMask(strength=500, radius=5, threshold=1)
v254 = v254.adjustBorders

va = BlankClip(v254, audio_rate = 48000, channels = 2).killVideo
v254 = v254.audioDub(va)

return v254.Prefetch

