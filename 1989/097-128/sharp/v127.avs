import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v127 = LSMASHVideoSource(dst_dir + "v127rc.mp4")

v127 = v127.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v127 = v127.convertToYV12(interlaced=false)

v127 = v127.UnsharpMask(strength=500, radius=5, threshold=1)
v127 = v127.adjustBorders

va = BlankClip(v127, audio_rate = 48000, channels = 2).killVideo
v127 = v127.audioDub(va)

return v127.Prefetch

