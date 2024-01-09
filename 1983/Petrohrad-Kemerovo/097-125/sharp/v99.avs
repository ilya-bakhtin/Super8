import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v99 = LSMASHVideoSource(dst_dir + "v99rc.mp4")

v99 = v99.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v99 = v99.convertToYV12(interlaced=false)

v99 = v99.UnsharpMask(strength=500, radius=5, threshold=1)
v99 = v99.adjustBorders

va = BlankClip(v99, audio_rate = 48000, channels = 2).killVideo
v99 = v99.audioDub(va)

return v99.Prefetch

