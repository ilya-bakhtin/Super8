import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v23 = LSMASHVideoSource(dst_dir + "v23rc.mp4")

v23 = v23.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v23 = v23.convertToYV12(interlaced=false)

v23 = v23.UnsharpMask(strength=500, radius=5, threshold=1)
v23 = v23.adjustBorders

va = BlankClip(v23, audio_rate = 48000, channels = 2).killVideo
v23 = v23.audioDub(va)

return v23.Prefetch

