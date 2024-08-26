import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v123 = LSMASHVideoSource(dst_dir + "v123rc.mp4")

v123 = v123.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v123 = v123.convertToYV12(interlaced=false)

v123 = v123.UnsharpMask(strength=500, radius=5, threshold=1)
v123 = v123.adjustBorders

va = BlankClip(v123, audio_rate = 48000, channels = 2).killVideo
v123 = v123.audioDub(va)

return v123.Prefetch

