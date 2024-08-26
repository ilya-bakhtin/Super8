import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v111 = LSMASHVideoSource(dst_dir + "v111rc.mp4")

v111 = v111.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v111 = v111.convertToYV12(interlaced=false)

v111 = v111.UnsharpMask(strength=500, radius=5, threshold=1)
v111 = v111.adjustBorders

va = BlankClip(v111, audio_rate = 48000, channels = 2).killVideo
v111 = v111.audioDub(va)

return v111.Prefetch

