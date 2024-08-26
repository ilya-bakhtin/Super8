import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v87 = LSMASHVideoSource(dst_dir + "v87rc.mp4")

v87 = v87.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v87 = v87.convertToYV12(interlaced=false)

v87 = v87.UnsharpMask(strength=500, radius=5, threshold=1)
v87 = v87.adjustBorders

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

return v87.Prefetch

