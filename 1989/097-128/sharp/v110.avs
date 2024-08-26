import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v110 = LSMASHVideoSource(dst_dir + "v110rc.mp4")

v110 = v110.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v110 = v110.convertToYV12(interlaced=false)

v110 = v110.UnsharpMask(strength=500, radius=5, threshold=1)
v110 = v110.adjustBorders

va = BlankClip(v110, audio_rate = 48000, channels = 2).killVideo
v110 = v110.audioDub(va)

return v110.Prefetch

