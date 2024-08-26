import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v105 = LSMASHVideoSource(dst_dir + "v105rc.mp4")

v105 = v105.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v105 = v105.convertToYV12(interlaced=false)

v105 = v105.UnsharpMask(strength=500, radius=5, threshold=1)
v105 = v105.adjustBorders

va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo
v105 = v105.audioDub(va)

return v105.Prefetch

