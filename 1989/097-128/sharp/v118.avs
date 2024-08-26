import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v118 = LSMASHVideoSource(dst_dir + "v118rc.mp4")

v118 = v118.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v118 = v118.convertToYV12(interlaced=false)

v118 = v118.UnsharpMask(strength=500, radius=5, threshold=1)
v118 = v118.adjustBorders

va = BlankClip(v118, audio_rate = 48000, channels = 2).killVideo
v118 = v118.audioDub(va)

return v118.Prefetch

