import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v79 = LSMASHVideoSource(dst_dir + "v79rc.mp4")

v79 = v79.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v79 = v79.convertToYV12(interlaced=false)

v79 = v79.UnsharpMask(strength=500, radius=5, threshold=1)
v79 = v79.adjustBorders

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

return v79.Prefetch

