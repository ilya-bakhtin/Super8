import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v347 = LSMASHVideoSource(dst_dir + "v347rc.mp4")

v347 = v347.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v347 = v347.convertToYV12(interlaced=false)

v347 = v347.UnsharpMask(strength=500, radius=5, threshold=1)
v347 = v347.adjustBorders

va = BlankClip(v347, audio_rate = 48000, channels = 2).killVideo
v347 = v347.audioDub(va)

return v347.Prefetch

