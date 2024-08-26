import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v86 = LSMASHVideoSource(dst_dir + "v86rc.mp4")

v86 = v86.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v86 = v86.convertToYV12(interlaced=false)

v86 = v86.UnsharpMask(strength=500, radius=5, threshold=1)
v86 = v86.adjustBorders

va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

return v86.Prefetch

