import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v69 = LSMASHVideoSource(dst_dir + "v69rc.mp4")

v69 = v69.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v69 = v69.convertToYV12(interlaced=false)

v69 = v69.UnsharpMask(strength=500, radius=5, threshold=1)
v69 = v69.adjustBorders

va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

return v69.Prefetch

