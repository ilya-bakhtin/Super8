import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v331 = LSMASHVideoSource(dst_dir + "v331rc.mp4")

v331 = v331.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v331 = v331.convertToYV12(interlaced=false)

v331 = v331.UnsharpMask(strength=500, radius=5, threshold=1)
v331 = v331.adjustBorders

va = BlankClip(v331, audio_rate = 48000, channels = 2).killVideo
v331 = v331.audioDub(va)

return v331.Prefetch

