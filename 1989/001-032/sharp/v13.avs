import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v13 = LSMASHVideoSource(dst_dir + "v13rc.mp4")

v13 = v13.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v13 = v13.convertToYV12(interlaced=false)

v13 = v13.UnsharpMask(strength=500, radius=5, threshold=1)
v13 = v13.adjustBorders

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

return v13.Prefetch

